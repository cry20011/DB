create schema cyber_sport_db;

create table cyber_sport_db.country
(
	country_id int not null
		constraint country_pk
			primary key,
	name text not null
);

create table cyber_sport_db.game
(
	game_id int not null
		constraint game_pk
			primary key,
	series_id int not null,
	game_num int not null,
	winner_id int
);

create table cyber_sport_db.player
(
	player_id int not null
		constraint player_pk
			primary key,
	name text not null,
	nickname text not null,
	team_id int not null,
	country_id int,
	prize int
);

create table cyber_sport_db.series
(
	series_id int not null
		constraint series_pk
			primary key,
	tournament_id int not null,
	series_type text not null,
	winner_id int not null
);

create table cyber_sport_db.team
(
	team_id int not null
		constraint team_pk
			primary key,
	name text not null,
	prize int,
	win_rate float,
	total_games_count int,
	country_id int,
	discipline text
);

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
	tournament_id int not null
		constraint tournament_pk
			primary key,
	name text not null,
	start_date date,
    end_date date,
    country_id int,
    city text,
    winner_id int not null,
    prize int,
    esports_discipline text
);

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
