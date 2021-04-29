/**********************************************************************************************************************/
/**********************************************************************************************************************/
/*************************************************** DDLs *************************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/


create schema cyber_sport_db;

create table cyber_sport_db.country
(
	country_id serial not null,
	name text not null
);

create unique index country_country_id_uindex
	on cyber_sport_db.country (country_id);

alter table cyber_sport_db.country
	add constraint country_pk
		primary key (country_id);

create table cyber_sport_db.game
(
	game_id serial not null,
	series_id int not null,
	game_num int not null,
	winner_id int
);

create unique index game_game_id_uindex
	on cyber_sport_db.game (game_id);

alter table cyber_sport_db.game
	add constraint table_name_pk
		primary key (game_id);


create table cyber_sport_db.player
(
	player_id serial not null,
	name text,
	nickname text,
	team_id int,
	country_id int,
	prize int
);

create unique index player_player_id_uindex
	on cyber_sport_db.player (player_id);

alter table cyber_sport_db.player
	add constraint player_pk
		primary key (player_id);


create table cyber_sport_db.series
(
	series_id serial not null,
    tournament_id int not null,
	series_type text not null,
	winner_id int not null
);

create unique index series_series_id_uindex
	on cyber_sport_db.series (series_id);

alter table cyber_sport_db.series
	add constraint series_pk
		primary key (series_id);

create table cyber_sport_db.team
(
	team_id serial not null,
	name text not null,
	prize int,
	win_rate float,
	total_games_count int,
	country_id int,
	discipline text
);

create unique index team_team_id_uindex
	on cyber_sport_db.team (team_id);

alter table cyber_sport_db.team
	add constraint team_pk
		primary key (team_id);


create table cyber_sport_db.team_series
(
	series_id int not null,
	team_id int not null
);

create table cyber_sport_db.teams_in_tournament
(
	tournament_id int not null,
	team_id int not null
);

create table cyber_sport_db.tournament
(
	tournament_id serial not null,
	name text not null,
	start_date date,
    end_date date,
    country_id int,
    city text,
    winner_id int not null,
    prize int,
    esports_discipline text
);

create unique index tournament_tournament_id_uindex
	on cyber_sport_db.tournament (tournament_id);

alter table cyber_sport_db.tournament
	add constraint tournament_pk
		primary key (tournament_id);



alter table cyber_sport_db.game
	add constraint series_id
		foreign key (series_id) references cyber_sport_db.series,
	add constraint team_id
		foreign key (winner_id) references cyber_sport_db.team;

alter table cyber_sport_db.player
	add constraint team_id
		foreign key (team_id) references cyber_sport_db.team,
    add constraint  country_id
        foreign key (country_id) references cyber_sport_db.country;

alter table cyber_sport_db.series
	add constraint tournament_id
		foreign key (tournament_id) references cyber_sport_db.tournament,
    add constraint team_id
        foreign key (winner_id) references cyber_sport_db.team;

alter table cyber_sport_db.team_series
	add constraint series_id
		foreign key (series_id) references cyber_sport_db.series,
    add constraint team_id
        foreign key (team_id) references cyber_sport_db.team;

alter table cyber_sport_db.teams_in_tournament
	add constraint tournament_id
		foreign key (tournament_id) references cyber_sport_db.tournament,
    add constraint team_id
        foreign key (team_id) references  cyber_sport_db.team;

alter table cyber_sport_db.tournament
	add constraint country_id
		foreign key (country_id) references cyber_sport_db.country,
    add constraint team_id
        foreign key (winner_id) references cyber_sport_db.team;

alter table cyber_sport_db.team
	add constraint country_id
		foreign key (country_id) references cyber_sport_db.country;





/**********************************************************************************************************************/
/**********************************************************************************************************************/
/************************************* INSERTS DELETES UPDATES SELECTS ************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/





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



INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Артур Бдшкин', 'Arteezy', 1, 2, 1554707);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Эйбэд Азэль Юсоп', 'Abed', 1, 3, 179550);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дэрил Кох Пэй Сян', 'iceiceice', 1, 4, 487598);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Андреас Франк Нильсен', 'Cr1t-', 1, 5, 1450340);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Таль Айзик', 'Fly-', 1, 6, 1808451);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Марк Фаусто', 'Raven', 2, 2, 336645);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Кам Бун Сенго', 'Moon', 2, 8, 209183);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ануча Джиравонг', 'Jabz', 2, 9, 215823);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Джардел Джико Мампусти', 'DJ', 2, 3, 140538);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ки Чуань Энг', 'CHYuan', 2, 8, 25595);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Цзинь Чжии', 'flyfly', 3, 7, 138702);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чжоу И', 'Emo', 3, 7, 135502);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Тиа Чжун Вэн', 'JT-', 3, 8, 146035);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ху Лянчжи', 'Kaka', 3, 7, 1420858);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чан Чон Кин', 'Oli', 3, 8, 1420858);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ян Шаохань', 'poyoyo', 4, 7, 22880);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Цзэн Цзяоян', 'Ori', 4, 7, 416517);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Рен Янвэй', 'ELeVeN', 4, 7, 316652);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Сюн Цзяхань', 'Pyw', 4, 7, 149492);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дин Цун', 'Dy', 4, 7, 312160);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Алонсо Леон', 'Mnz', 5, 10, 30443);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Леонардо Сифуэнтос', 'Leostyle', 5, 10, 17383);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Франк Ариес', 'Frank', 5, 10, 12783);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Джоэл Мори Озамбела', 'MoOz', 5, 10, 8600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ромель Квинтерос', 'Mjz', 5, 10, 15643);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лассе Урпалайнен', 'MATUMBAMAN', 6, 11, 3148579);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Михал Янковски', 'Nisha', 6, 12, 475037);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Людвиг Уолберг', 'zai', 6, 13, 1567777);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Язид Жарадат', 'YapzOr', 6, 14, 699981);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Клемент Иванов', 'Puppey', 6, 15, 1283349);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Егор Григоренко', 'Epileptick1d', 7, 16, 91257);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Данил Скутин', 'gpK~', 7, 16, 95564);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Дорохин', 'DM', 7, 16, 100644);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Виталий Мельник', 'Save-', 7, 17, 91194);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ильяс Ганеев', 'Kingslayer', 7, 16, 46000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ван Чуньюй', 'Ame', 8, 7, 1944888);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чэн Цзинь Сян', 'NothingToSay', 8, 8, 78152);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чжан Жуйда', 'Faith_bian', 8, 7, 1991952);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чжао Цзысин', 'XinQ', 8, 7, 101175);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чжан Липин', 'y', 8, 7, 2004952);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Явар Хассан', 'YawaR', 9, 18, 116834);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Квин Каллахан', 'Quinn', 9, 1, 144544);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Родриго Лелис Сантос', 'Lelis', 9, 19, 44784);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ариф Анвар', 'MSS', 9, 1, 128280);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Авери Сильверман', 'SVG', 9, 1, 121034);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ду Пэн', 'Monet', 10, 7, 604138);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лю Лю Юхао Юхао', 'DD斩首', 10, 7, 38302);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лин Дзин', 'Xxs', 10, 7, 175071);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Е Чжибяо', 'Borax', 10, 7, 175071);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Чжан Чжичэн', 'LaNm', 10, 7, 256725);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Майк Ву', 'miCKe', 11, 13, 84715);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Макс Брокер', 'qojqva', 11, 20, 120875);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Самуэль Сван', 'Boxi', 11, 13, 91415);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Томми Ле', 'Taiga', 11, 21, 91815);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Айден Саркои', 'iNSaNiA', 11, 13, 92128);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Джон Варгас', 'Natsumi', 12, 3, 26619);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Эрин Джаспер Феррер', 'Yopaj', 12, 3, 11197);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Преме Ижай Бенкил', 'PlayHard', 12, 3, 16235);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ролен Андре Габриэль Онг', 'Skemberlu', 12, 3, 27623);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Жунюэль Арцилла', 'Jaunuel', 12, 3, 11336);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Топиас Таавитсайнен', 'Topson', 13, 11, 5335318);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Анатан Фам', 'ana', 13, 22, 5714421);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Себастьян Дебс', 'Ceb', 13, 23, 5359577);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Ессе Вайникка', 'JerAx', 13, 11, 6022301);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Йохан Сундштайн', 'n0tail', 13, 5, 6446013);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Амер аль-Баркави', 'Miracle-', 14, 14, 4435205);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Иван Бориславов', 'MinD_ContRoL', 14, 24, 4162951);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Марун Мерхей', 'GH', 14, 25, 3908528);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Куро Салехи Тахасоми', 'KuroKy', 14, 20, 4350244);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Аливи Комар', 'w33haa', 14, 26, 2319287);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Юрий Сантуш', 'Yuurih', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Андрей Пиовезан', 'arT', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Виниций Фигуэйреду', 'VINI', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Кайке Керато', 'kscerato', 15, 19, 142040);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Пэйтин Джонсон', 'Junior', 15, 1, 9000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лукас Кано', 'honda', 15, 19, 0);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лукас Россандэр', 'gla1ve', 16, 5, 1426680);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Питер Расмуссен', 'dupreeh', 16, 5, 1538116);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Андреас Хойслет', 'Xyp9x', 16, 5, 1520316);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Эмиль Рейф', 'Magisk', 16, 5, 1173780);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Лукас Андерсен', 'Bubzkji', 16, 5, 219126);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Николай Ридтц', 'device', 17, 5, 1515116);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Эрик Густафссон', 'ztr', 17, 13, 6000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Фредрик Стернер', 'REZ', 17, 13, 155425);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Николас Гонсалес Замора', 'Plopski', 17, 13, 41150);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Хампус Позер', 'hampus', 17, 13, 50803);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Бенджамин Бремер', 'blameF', 18, 5, 108250);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Джастин Сэвэйдж', 'jks', 18, 22, 110400);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Вилл Виерзба', 'RUSH', 18, 1, 395100);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Валентин Василев', 'poizon', 18, 24, 222531);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Кристиан Винеке', 'k0nfig', 18, 5, 261080);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Каспер Мёллер', 'cadiaN', 19, 5, 167195);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Йоханнес Боруп', 'b0RUP', 19, 5, 107516);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Мартин Лунд', 'stavn', 19, 5, 135000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Рене Мадсен', 'TeSeS', 19, 5, 110650);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Абай Хасенов', 'HObbit', 20, 27, 338159);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Тимофей Якушин', 'interz', 20, 16, 166000);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Владислав Горшков', 'nafany', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Сергей Рыхторов', 'Ax1Le', 20, 16, 160000);

INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);

DELETE FROM cyber_sport_db.player WHERE nickname='sh1ro';
INSERT INTO cyber_sport_db.player(name, nickname, team_id, country_id, prize) VALUES ('Дмитрий Соколов', 'sh1ro', 20, 16, 168600);
UPDATE cyber_sport_db.player SET player_id=100 WHERE name='Дмитрий Соколов';


UPDATE cyber_sport_db.player SET name='Артур Бабаев' WHERE name='Артур Бдшкин';
UPDATE cyber_sport_db.player SET name='Аливи Омар', nickname='w33'  WHERE player_id=(SELECT player_id FROM cyber_sport_db.player WHERE name='Аливи Комар' AND nickname='w33haa');

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
INSERT INTO cyber_sport_db.series(tournament_id, series_type, winner_id) VALUES (1, 'bo5', 3);
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





/**********************************************************************************************************************/
/**********************************************************************************************************************/
/****************************************** SMART SELECTS *************************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/







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


/* Узнать какое количество игр сыграла каждая команда в приведенных турнирах, и разницу со следующей по убыванию */
/*count_diff*/
SELECT team.name, games_count, games_count - LEAD(count_games.games_count) OVER (ORDER BY count_games.games_count DESC) AS diff
FROM cyber_sport_db.team INNER JOIN
    (SELECT DISTINCT team_id, COUNT(team_id) AS games_count
    FROM cyber_sport_db.game INNER JOIN cyber_sport_db.team_series ON game.series_id = team_series.series_id
    GROUP BY team_id
    ORDER BY team_id) AS count_games ON team.team_id = count_games.team_id;





/**********************************************************************************************************************/
/**********************************************************************************************************************/
/*********************************************** VIEWS ****************************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/






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
END
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




/**********************************************************************************************************************/
/**********************************************************************************************************************/
/************************************************ PROCEDURES **********************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/





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





/**********************************************************************************************************************/
/**********************************************************************************************************************/
/*********************************************** TRIGGERS *************************************************************/
/**********************************************************************************************************************/
/**********************************************************************************************************************/


CREATE OR REPLACE FUNCTION delete_update_connected_with_this_series() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        DELETE FROM cyber_sport_db.team_series WHERE team_series.series_id = OLD.series_id;
        DELETE FROM cyber_sport_db.game WHERE game.series_id = OLD.series_id;
        IF NOT FOUND THEN RETURN NULL; END IF;
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE cyber_sport_db.team_series SET team_series.series_id = NEW.series_id WHERE team_series.series_id = OLD.series_id;
        UPDATE cyber_sport_db.game SET game.series_id = NEW.series_id WHERE game.series_id = OLD.series_id;
        IF NOT FOUND THEN RETURN NULL; END IF;
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;


/* Правильное удаление или обновление серии */
CREATE TRIGGER delete_update_series
    BEFORE DELETE OR UPDATE ON cyber_sport_db.series
    FOR EACH ROW
    WHEN (OLD.series_id IS DISTINCT FROM NEW.series_id)
    EXECUTE PROCEDURE delete_update_connected_with_this_series();

DROP TRIGGER delete_series ON cyber_sport_db.series;



CREATE OR REPLACE FUNCTION delete_copies() RETURNS TRIGGER AS $$
BEGIN
   DELETE FROM cyber_sport_db.player WHERE name = NEW.name AND nickname = NEW.nickname;
   RETURN NEW;
END
$$ LANGUAGE plpgsql;


CREATE TRIGGER insert_update_player
    BEFORE INSERT OR UPDATE ON cyber_sport_db.player
    FOR EACH ROW
    EXECUTE PROCEDURE delete_copies();












drop schema cyber_sport_db cascade;




