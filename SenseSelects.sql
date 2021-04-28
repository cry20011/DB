/* Узнать топ 20 самых богатых игроков их команды и страны. */
/*top20_prize*/
SELECT player.name, nickname, country.name, team.name, team.discipline, player.prize
FROM cyber_sport_db.player INNER JOIN cyber_sport_db.country ON player.country_id = country.country_id INNER JOIN cyber_sport_db.team ON player.team_id = team.team_id
WHERE player.prize >= 1000000
ORDER BY prize DESC LIMIT 20;


/* Средние и максимальные(и имя игрока) призовые игрков по команде, и, собственно суммарные призовые команды за всё время */
/*avg_max*/
SELECT mean_by_team.name, mean_by_team.mean_player_prize, mean_by_team.max_player_prize, player.nickname, mean_by_team.team_prize, mean_by_team.discipline
FROM cyber_sport_db.player INNER JOIN (
    SELECT team.team_id, team.name, FLOOR(AVG(player.prize)) AS mean_player_prize , MAX(player.prize) AS max_player_prize, team.prize AS team_prize , discipline
    FROM cyber_sport_db.player INNER JOIN cyber_sport_db.team ON player.team_id = team.team_id
    GROUP BY team.team_id
    HAVING AVG(player.prize) > 100000
    ORDER BY mean_player_prize DESC) AS mean_by_team ON player.team_id = mean_by_team.team_id AND player.prize = mean_by_team.max_player_prize
ORDER BY mean_by_team.mean_player_prize DESC;

/* Узнать какой процент от общих призовых в команде у кажого игрока */
/*prize_percent*/
SELECT team.name, player.nickname, player.prize, SUM(player.prize) OVER (PARTITION BY team.team_id ORDER BY player.prize DESC RANGE CURRENT ROW ) AS sum_prize, ROUND(CAST(player.prize AS FLOAT) / SUM(player.prize) OVER (PARTITION BY team.team_id) * 100) AS percent
FROM cyber_sport_db.team INNER JOIN cyber_sport_db.player ON player.team_id = team.team_id;


/* Узнать какие команды играли в финалах трех турниров (то есть играли в bo5 серии) */
/*Finals*/
SELECT team.name, tournament.name, tournament.winner_id = team.team_id AS winner
FROM cyber_sport_db.team INNER JOIN cyber_sport_db.teams_in_tournament ON team.team_id = teams_in_tournament.team_id INNER JOIN cyber_sport_db.tournament ON teams_in_tournament.tournament_id = tournament.tournament_id INNER JOIN cyber_sport_db.team_series ON team.team_id = team_series.team_id INNER JOIN (
    SELECT series_id, DENSE_RANK() OVER (ORDER BY series_type) AS series_type_id
    FROM cyber_sport_db.series) AS series_types ON team_series.series_id = series_types.series_id
WHERE series_types.series_type_id = 2;


/* Узнать какое количество игр сыграла каждая команда в приведенных турнирах, и разницу со следующей по убываюни*/
/*count_diff*/
SELECT team.name, games_count, games_count - LEAD(count_games.games_count) OVER (ORDER BY count_games.games_count DESC) AS diff
FROM cyber_sport_db.team INNER JOIN
    (SELECT DISTINCT team_id, COUNT(team_id) AS games_count
    FROM cyber_sport_db.game INNER JOIN cyber_sport_db.team_series ON game.series_id = team_series.series_id
    GROUP BY team_id
    ORDER BY team_id) AS count_games ON team.team_id = count_games.team_id;
