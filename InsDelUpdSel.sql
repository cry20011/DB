INSERT INTO cyber_sport_db.country(name) VALUES ('USA');
INSERT INTO cyber_sport_db.country(name) VALUES ('Canada');
INSERT INTO cyber_sport_db.country(name) VALUES ('Philippines');
INSERT INTO cyber_sport_db.country(name) VALUES ('Singapore');
INSERT INTO cyber_sport_db.country(name) VALUES ('Denmark');
INSERT INTO cyber_sport_db.country(name) VALUES ('Israel');
INSERT INTO cyber_sport_db.country(name) VALUES ('China');
INSERT INTO cyber_sport_db.country(name) VALUES ('Malaysia');
INSERT INTO cyber_sport_db.country(name) VALUES ('Thailand');
INSERT INTO cyber_sport_db.country(name) VALUES ('Peru');
INSERT INTO cyber_sport_db.country(name) VALUES ('Finland');
INSERT INTO cyber_sport_db.country(name) VALUES ('Poland');
INSERT INTO cyber_sport_db.country(name) VALUES ('Sweden');
INSERT INTO cyber_sport_db.country(name) VALUES ('Iordan');
INSERT INTO cyber_sport_db.country(name) VALUES ('Estonia');
INSERT INTO cyber_sport_db.country(name) VALUES ('Russia');
INSERT INTO cyber_sport_db.country(name) VALUES ('Moldova');
INSERT INTO cyber_sport_db.country(name) VALUES ('Pakistan');
INSERT INTO cyber_sport_db.country(name) VALUES ('Brazil');
INSERT INTO cyber_sport_db.country(name) VALUES ('Germany');
INSERT INTO cyber_sport_db.country(name) VALUES ('Norway');
INSERT INTO cyber_sport_db.country(name) VALUES ('Australia');
INSERT INTO cyber_sport_db.country(name) VALUES ('France');
INSERT INTO cyber_sport_db.country(name) VALUES ('Bolgaria');
INSERT INTO cyber_sport_db.country(name) VALUES ('Lebanon');
INSERT INTO cyber_sport_db.country(name) VALUES ('Romania');
INSERT INTO cyber_sport_db.country(name) VALUES ('Kazakhstan');
INSERT INTO cyber_sport_db.country(name) VALUES ('Malta');
INSERT INTO cyber_sport_db.country(name) VALUES ('Malta');
INSERT INTO cyber_sport_db.country(name) VALUES ('Ukraine');


DELETE FROM cyber_sport_db.country WHERE country_id=29;
DELETE FROM cyber_sport_db.country WHERE name=(SELECT name FROM cyber_sport_db.country WHERE country_id = 30);
UPDATE cyber_sport_db.country SET name='Bulgaria' WHERE country_id=24;
UPDATE cyber_sport_db.country SET name='Jordan' WHERE name='Iordan';

INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Evil Geniuses', 19837479, 0.63, 818, (SELECT country_id FROM cyber_sport_db.country WHERE name='USA'), 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Fnatic', 3276975, 0.6, 598, 7, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Invictus Gaming', 5256147, 0.57, 1121, 7, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Vici Gaming', 8962283, 0.59, 1097, 7, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Thunder Predator', 155165, 0.57, 284, 10, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Team Secret', 11204477, 0.7, 711, 11, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Virtus Pro', 9470128, 0.58, 997, 16, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('PSG.LGD', 16184538, 0.61, 1064, 7, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Quincy Crew', 185422, 0.74, 115, 1, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Team Aster', 396339, 0.53, 357, 7, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Team Liquid', 23835650, 0.58, 787, 13, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('OB Esports x Neon', 138430, 0.45, 251, 3, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('OG', 32913323, 0.62, 523, 5, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Nigma', 524614, 0.56, 141, 20, 'DotA 2');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('FURIA Esports', 882200, 0.62, 237, 19, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Astralis', 7778562, 0.7, 704, 5, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Ninjas in Pyjamas', 2757904, 0.57, 1024, 13, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Complex Gaming', 119325000, 0.44, 10000, 1, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Heroic', 1221500, 0.54, 601, 5, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('Gambit Esports', 1795045, 0.55, 438, 16, 'CS:GO');
INSERT INTO cyber_sport_db.team(name, prize, win_rate, total_games_count, country_id, discipline) VALUES ('JAJ TEAM', 123, 0.55, 12438, 1, 'CS:GO');

DELETE FROM cyber_sport_db.team WHERE name=(SELECT name FROM cyber_sport_db.team WHERE team_id=21);

UPDATE cyber_sport_db.team SET discipline='Dota 2' WHERE discipline='DotA 2';
UPDATE cyber_sport_db.team SET name='Complexity Gaming', prize=1193250, total_games_count=574, country_id=5 WHERE team_id=18;



INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'Arteezy', 1, 2, 1554707);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ?????????? ????????', 'Abed', 1, 3, 179550);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ?????? ?????? ??????', 'iceiceice', 1, 4, 487598);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ?????????? ??????????????', 'Cr1t-', 1, 5, 1450340);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????', 'Fly-', 1, 6, 1808451);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'Raven', 2, 2, 336645);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ?????? ??????????', 'Moon', 2, 8, 209183);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????????????', 'Jabz', 2, 9, 215823);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ?????????? ????????????????', 'DJ', 2, 3, 140538);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???? ?????????? ??????', 'CHYuan', 2, 8, 25595);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????', 'flyfly', 3, 7, 138702);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??', 'Emo', 3, 7, 135502);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ???????? ??????', 'JT-', 3, 8, 146035);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???? ????????????', 'Kaka', 3, 7, 1420858);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ?????? ??????', 'Oli', 3, 8, 1420858);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???? ??????????????', 'poyoyo', 4, 7, 22880);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'Ori', 4, 7, 416517);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ??????????', 'ELeVeN', 4, 7, 316652);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ??????????????', 'Pyw', 4, 7, 149492);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ??????', 'Dy', 4, 7, 312160);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????', 'Mnz', 5, 10, 30443);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????????? ??????????????????', 'Leostyle', 5, 10, 17383);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????', 'Frank', 5, 10, 12783);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ???????? ????????????????', 'MoOz', 5, 10, 8600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ??????????????????', 'Mjz', 5, 10, 15643);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????????????', 'MATUMBAMAN', 6, 11, 3148579);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????????', 'Nisha', 6, 12, 475037);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ??????????????', 'zai', 6, 13, 1567777);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????????', 'YapzOr', 6, 14, 699981);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ????????????', 'Puppey', 6, 15, 1283349);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????????????', 'Epileptick1d', 7, 16, 91257);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'gpK~', 7, 16, 95564);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'DM', 7, 16, 100644);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'Save-', 7, 17, 91194);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'Kingslayer', 7, 16, 46000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ????????????', 'Ame', 8, 7, 1944888);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ?????????? ??????', 'NothingToSay', 8, 8, 78152);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????', 'Faith_bian', 8, 7, 1991952);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'XinQ', 8, 7, 101175);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????', 'y', 8, 7, 2004952);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'YawaR', 9, 18, 116834);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????????', 'Quinn', 9, 1, 144544);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ?????????? ????????????', 'Lelis', 9, 19, 44784);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????', 'MSS', 9, 1, 128280);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????????????', 'SVG', 9, 1, 121034);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???? ??????', 'Monet', 10, 7, 604138);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???? ???? ???????? ????????', 'DD??????', 10, 7, 38302);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????? ????????', 'Xxs', 10, 7, 175071);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?? ????????????', 'Borax', 10, 7, 175071);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'LaNm', 10, 7, 256725);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????', 'miCKe', 11, 13, 84715);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'qojqva', 11, 20, 120875);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ????????', 'Boxi', 11, 13, 91415);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????', 'Taiga', 11, 21, 91815);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'iNSaNiA', 11, 13, 92128);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'Natsumi', 12, 3, 26619);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ?????????????? ????????????', 'Yopaj', 12, 3, 11197);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ???????? ????????????', 'PlayHard', 12, 3, 16235);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ?????????? ???????????????? ??????', 'Skemberlu', 12, 3, 27623);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'Jaunuel', 12, 3, 11336);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????????????????????', 'Topson', 13, 11, 5335318);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ??????', 'ana', 13, 22, 5714421);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????????? ????????', 'Ceb', 13, 23, 5359577);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????????', 'JerAx', 13, 11, 6022301);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????????????', 'n0tail', 13, 5, 6446013);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????-??????????????', 'Miracle-', 14, 14, 4435205);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????????????', 'MinD_ContRoL', 14, 24, 4162951);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'GH', 14, 25, 3908528);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ???????????? ????????????????', 'KuroKy', 14, 20, 4350244);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????', 'w33haa', 14, 26, 2319287);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'Yuurih', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????????????', 'arT', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ????????????????????', 'VINI', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????', 'kscerato', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ??????????????', 'Junior', 15, 1, 9000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????', 'honda', 15, 19, 0);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????????????', 'gla1ve', 16, 5, 1426680);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ??????????????????', 'dupreeh', 16, 5, 1538116);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'Xyp9x', 16, 5, 1520316);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????', 'Magisk', 16, 5, 1173780);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????? ????????????????', 'Bubzkji', 16, 5, 219126);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????', 'device', 17, 5, 1515116);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????????????', 'ztr', 17, 13, 6000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'REZ', 17, 13, 155425);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ???????????????? ????????????', 'Plopski', 17, 13, 41150);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ??????????', 'hampus', 17, 13, 50803);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????????? ????????????', 'blameF', 18, 5, 108250);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'jks', 18, 22, 110400);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????????', 'RUSH', 18, 1, 395100);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????????? ??????????????', 'poizon', 18, 24, 222531);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????????? ????????????', 'k0nfig', 18, 5, 261080);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????????', 'cadiaN', 19, 5, 167195);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????????? ??????????', 'b0RUP', 19, 5, 107516);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????', 'stavn', 19, 5, 135000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ????????????', 'TeSeS', 19, 5, 110650);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????? ??????????????', 'HObbit', 20, 27, 338159);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ????????????', 'interz', 20, 16, 166000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????????? ??????????????', 'nafany', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('???????????? ????????????????', 'Ax1Le', 20, 16, 160000);

INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);

DELETE FROM cyber_sport_db.player WHERE nickname='sh1ro';
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('?????????????? ??????????????', 'sh1ro', 20, 16, 168600);
UPDATE cyber_sport_db.player SET player_id=100 WHERE name='?????????????? ??????????????';


UPDATE cyber_sport_db.player SET name='?????????? ????????????' WHERE name='?????????? ????????????';
UPDATE cyber_sport_db.player SET name='?????????? ????????', nickname='w33'  WHERE player_id=(SELECT player_id FROM cyber_sport_db.player WHERE name='?????????? ??????????' AND nickname='w33haa');

INSERT INTO cyber_sport_db.tournament(name, start_date, end_date, country_id, city, winner_id, prize, esports_discipline) VALUES ('Singapore Major Dota 2', TO_DATE('27-03-2020', 'DD-MM-YYYY'), TO_DATE('04-04-2021', 'DD-MM-YYYY'), 4, 'Singapore', 3, 500000, 'DotA 2');
INSERT INTO cyber_sport_db.tournament(name, start_date, end_date, country_id, city, winner_id, prize, esports_discipline) VALUES ('The International 2019', TO_DATE('15-08-2019', 'DD-MM-YYYY'), TO_DATE('25-08-2019', 'DD-MM-YYYY'), 7, 'Shanghai', 13, 34330068, 'DotA 2');
INSERT INTO cyber_sport_db.tournament(name, start_date, end_date, country_id, city, winner_id, prize, esports_discipline) VALUES ('ESL Pro League Season 13', TO_DATE('08-03-2021', 'DD-MM-YYYY'), TO_DATE('11-04-2021', 'DD-MM-YYYY'), 28, 'Malta', 19, 750000, 'CS:GO');

UPDATE cyber_sport_db.tournament SET start_date=TO_DATE('27-03-2021', 'DD-MM-YYYY') WHERE tournament_id=(SELECT tournament_id FROM cyber_sport_db.tournament WHERE name='Singapore Major Dota 2');
UPDATE cyber_sport_db.tournament SET esports_discipline='Dota 2' WHERE esports_discipline='DotA 2';

INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 1);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 6);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 8);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 7);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 5);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 4);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 12);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 5);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 12);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 1);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 8);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 6);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 1);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo3', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (2, 'bo3', 14);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (2, 'bo3', 13);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (2, 'bo3', 14);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (2, 'bo5', 13);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (3, 'bo3', 15);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (3, 'bo3', 17);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (3, 'bo3', 19);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (3, 'bo3', 20);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (2, 'bo3', 19);

INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo10', 8);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo10', 3);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo10', 6);
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo10', 3);
DELETE FROM cyber_sport_db.series WHERE series_type='bo10';


UPDATE cyber_sport_db.series SET tournament_id=3, series_type='bo5' WHERE series_id=27;

INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (1, 1, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (1, 2, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (2, 1, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (2, 2, 4);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (2, 3, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (3, 1, 6);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (3, 2, 6);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (4, 1, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (4, 2, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (5, 1, 9);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (5, 2, 7);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (5, 3, 7);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (6, 1, 5);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (6, 2, 5);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (7, 1, 4);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (7, 2, 4);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (8, 1, 12);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (8, 2, 2);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (8, 3, 12);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (9, 1, 5);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (9, 2, 5);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (10, 1, 4);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (10, 2, 12);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (10, 3, 12);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (11, 1, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (11, 2, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (12, 1, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (12, 2, 6);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (12, 3, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (13, 1, 5);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (13, 2, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (13, 3, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (14, 1, 6);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (14, 2, 12);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (14, 3, 6);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (15, 1, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (15, 2, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (16, 1, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (16, 2, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (16, 3, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (17, 1, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (17, 2, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (17, 3, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (18, 1, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (18, 2, 1);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (18, 3, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (18, 4, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (18, 5, 3);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (19, 2, 14);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (19, 1, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (19, 1, 14);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (20, 2, 13);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (20, 3, 13);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (21, 1, 8);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (21, 2, 14);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (21, 3, 14);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (22, 1, 14);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (22, 2, 13);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (22, 3, 13);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (22, 4, 13);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (23, 1, 15);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (23, 2, 15);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (24, 1, 18);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (24, 2, 17);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (24, 3, 17);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (25, 1, 19);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (25, 2, 19);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (26, 1, 20);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (26, 2, 20);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (27, 1, 19);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (27, 2, 20);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (27, 3, 19);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (27, 4, 20);
INSERT INTO cyber_sport_db.game(series_id, game_num, winner_id) VALUES (27, 5, 19);

INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 3);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 3);
DELETE FROM cyber_sport_db.teams_in_tournament;

INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 1);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 2);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 3);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 4);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 5);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 6);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 7);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 8);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 9);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 10);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 11);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (1, 12);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) values (2, 6);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) values (2, 8);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) values (2, 13);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) values (2, 14);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 15);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 16);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 17);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 18);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 19);
INSERT INTO cyber_sport_db.teams_in_tournament(tournament_id, team_id) VALUES (3, 20);


INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 2);
DELETE FROM cyber_sport_db.team_series;

INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (1, 1);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (1, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (2, 4);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (3, 5);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (3, 6);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (4, 7);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (4, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (5, 7);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (5, 9);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (6, 5);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (6, 10);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (7, 4);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (7, 11);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (8, 2);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (8, 12);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (9, 7);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (9, 5);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (10, 4);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (10, 12);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (11, 1);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (11, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (12, 6);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (12, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (13, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (13, 5);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (14, 6);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (14, 12);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (15, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (15, 6);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (16, 1);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (16, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (17, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (17, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (18, 1);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (18, 3);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (19, 6);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (19, 14);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (20, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (20, 13);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (21, 8);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (21, 14);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (22, 13);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (22, 14);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (23, 15);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (23, 16);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (24, 17);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (24, 18);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (25, 15);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (25, 19);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (26, 20);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (26, 17);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (27, 19);
INSERT INTO cyber_sport_db.team_series(series_id, team_id) VALUES (27, 20);
