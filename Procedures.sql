/* Информация о игроке */
CREATE OR REPLACE PROCEDURE player_info_by_nickname(nickname_ text DEFAULT '') LANGUAGE SQL AS $$
    DROP TABLE IF EXISTS cyber_sport_db.player_info_from_procedure;
    CREATE TABLE cyber_sport_db.player_info_from_procedure AS
        SELECT player_ids.name AS name, player_ids.nickname AS nickname, player_ids.prize AS prize, team.name AS team, discipline, country.name AS country
        FROM cyber_sport_db.team INNER JOIN (
            SELECT *
            FROM cyber_sport_db.player
            WHERE player.nickname = nickname_
        ) AS player_ids ON player_ids.team_id = team.team_id INNER JOIN cyber_sport_db.country ON team.country_id = country.country_id;
$$;

CALL player_info_by_nickname('Topson');

SELECT * FROM cyber_sport_db.player_info_from_procedure;

DROP TABLE IF EXISTS cyber_sport_db.player_info_from_procedure;




/* id команды по названию */
CREATE OR REPLACE FUNCTION get_team_id(team_name text) RETURNS int AS $$
DECLARE
    team_id_ int := 0;
BEGIN
    SELECT team_id FROM cyber_sport_db.team WHERE team.name = team_name INTO team_id_;
    RETURN team_id_;
END
$$ LANGUAGE plpgsql;


/* id страны по названию */
CREATE OR REPLACE FUNCTION get_country_id(country_name text) RETURNS int AS $$
DECLARE
    country_id_ int := 0;
BEGIN
    SELECT country_id FROM cyber_sport_db.country WHERE country.name = country_name INTO country_id_;
    RETURN country_id_;
END
$$ LANGUAGE plpgsql;

DROP FUNCTION get_team_id(team_name text);
DROP FUNCTION get_country_id(country_name text);

SELECT * FROM get_team_id('OG');
SELECT * FROM get_country_id('Denmark');

CREATE OR REPLACE PROCEDURE insert_player(name_ text, nickname_ text, country_ text, team_ text, prize_ int DEFAULT 0) LANGUAGE plpgsql AS $$
    DECLARE
        team_id_ int := 0;
        country_id_ int := 0;
    BEGIN
        team_id_ = get_team_id(team_);
        country_id_ = get_country_id(country_);
       INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize)  VALUES (name_, nickname_, team_id_, country_id_, prize_);
    END
$$;

DROP PROCEDURE insert_player(name_ text, nickname_ text, country_ text, team_ text, prize_ int);


DELETE FROM cyber_sport_db.player WHERE nickname = 'sh1ro';
CALL insert_player('Дмитрий Соколов', 'sh1ro', 'Germany', 'Astralis', 168600);
