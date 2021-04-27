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
