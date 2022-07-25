DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL UNIQUE
);
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL UNIQUE,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL UNIQUE
);
CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    other_team_id INTEGER REFERENCES teams,
    location TEXT,
    date Date,
    start_time TEXT,
    season_id INTEGER REFERENCES seasons,
    head_referre_id INTEGER REFERENCES referees,
    assistent_referre_1_id INTEGER REFERENCES referees,
    assistent_referre_2_id INTEGER REFERENCES referees
);
CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    mathch_id INTEGER REFERENCES matches
);
CREATE TABLE results(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT 
);
CREATE table lineups(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams
);