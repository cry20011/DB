CREATE OR REPLACE FUNCTION mask_text(text_ text, left_ int DEFAULT 0, right_ int DEFAULT -1) RETURNS text AS $$
DECLARE
    mask text := '';
    text_len int := length(text_);
BEGIN
    IF right_ = -1 OR right_ > text_len THEN right_ = text_len; END IF;
    mask = left(text_, left_);
    FOR i IN left_ .. right_ - 1 BY 1
        LOOP
        mask = concat(mask, '*');
        END LOOP;
    mask = concat(mask, right(text_, text_len - right_));
    RETURN mask;
END;
$$ LANGUAGE plpgsql;

/* Маскируем имя и никнейм игрока */
CREATE OR REPLACE VIEW mask_name_nickname AS
    SELECT mask_text(name, 1, 10) AS name, mask_text(nickname, 0, 5) AS nickname
    FROM cyber_sport_db.player;

DROP VIEW IF EXISTS mask_name_nickname;

SELECT * FROM mask_name_nickname;


/* Маскируем призовые игрока */
CREATE OR REPLACE VIEW mask_prize AS
    SELECT name, nickname, mask_text(CAST(prize AS text))
    FROM cyber_sport_db.player;

DROP VIEW IF EXISTS mask_prize;

SELECT * FROM mask_prize;


/* Информация по турниру */
CREATE OR REPLACE VIEW tournaments_info AS
    SELECT tournament_name, start_date, end_date, country_name, city, prize, esports_discipline, winner, tour_sg_count.series_count, tour_sg_count.game_count
    FROM
        /* количество серий и игр в турнирах */
        (SELECT s_count.tournament_id, series_count, game_count
        FROM
            /* количество серий */
            (SELECT tournament.tournament_id, count(series_id) AS series_count
            FROM cyber_sport_db.tournament INNER JOIN cyber_sport_db.series ON tournament.tournament_id = series.tournament_id
            GROUP BY tournament.tournament_id) AS s_count
                INNER JOIN
            /* количество игр */
            (SELECT tournament_id, count(game_id) AS game_count
            FROM cyber_sport_db.series INNER JOIN cyber_sport_db.game ON series.series_id = game.series_id
            GROUP BY tournament_id) AS g_count
                ON s_count.tournament_id = g_count.tournament_id) AS tour_sg_count

            INNER JOIN
        /* название турнира, начало, конец, страна, город, призовые, дисциплина, команда победитель */
        (SELECT tournament_country.*, team.name AS winner
        FROM
            (SELECT tournament_id, tournament.name AS tournament_name, start_date, end_date, country.name AS country_name, city, winner_id, prize, esports_discipline
            FROM
                cyber_sport_db.tournament
                    INNER JOIN
                cyber_sport_db.country
                    ON tournament.country_id = country.country_id) AS tournament_country
                    INNER JOIN
                cyber_sport_db.team
                    ON tournament_country.winner_id = team.team_id) AS tour_info

            ON tour_info.tournament_id = tour_sg_count.tournament_id
    ORDER BY tournament_name;


DROP VIEW IF EXISTS tournaments_info;

SELECT * FROM tournaments_info;

/* процент побед команды в приведенных турнирах */
CREATE OR REPLACE VIEW win_rate_in_tournaments AS
    SELECT name, tours_win_rate.win_rate
    FROM cyber_sport_db.team INNER JOIN
        (SELECT team_id, round((CAST(SUM(CAST(team_id = winner_id AS int)) AS float) / SUM(1)) * 100) AS win_rate
        FROM cyber_sport_db.team_series INNER JOIN cyber_sport_db.game ON game.series_id = team_series.series_id
        GROUP BY team_id
        ORDER BY team_id) AS tours_win_rate ON tours_win_rate.team_id = team.team_id
    ORDER BY tours_win_rate.win_rate DESC;

DROP VIEW win_rate_in_tournaments;

SELECT * FROM win_rate_in_tournaments;


/* информация о игроках */
CREATE OR REPLACE  VIEW players_info AS
    SELECT player.name AS name, nickname, country.name AS country, team.name AS team, discipline, player.prize AS prize
    FROM cyber_sport_db.player INNER JOIN cyber_sport_db.country on country.country_id = player.country_id INNER JOIN cyber_sport_db.team ON player.team_id = team.team_id
    ORDER BY name;

DROP VIEW players_info;

SELECT * FROM players_info;


/* Количество игроков из страны, и сумма призовых */
CREATE OR REPLACE VIEW country_players AS
    SELECT country.name, count(player_id) AS players_count, sum(prize) AS sum_prize
    FROM cyber_sport_db.country INNER JOIN cyber_sport_db.player ON country.country_id = player.country_id
    GROUP BY country.country_id
    ORDER BY players_count DESC;

DROP VIEW country_players;

SELECT * FROM country_players;
