-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy TEXT NOT NULL DEFAULT 'Milky Way',
  moons TEXT[]
);
CREATE TABLE orbits_arounds(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE planet_orbits_arounds(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  orbits_around_id INTEGER REFERENCES orbits_arounds
);

INSERT INTO orbits_arounds(name) VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, moons)
VALUES
  ('Earth', 1.00, '{"The Moon"}'),
  ('Mars', 1.88, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, '{}'),
  ('Neptune', 164.8, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, '{}'),
  ('Gliese 876 b', 0.23, '{}');

INSERT INTO planet_orbits_arounds(planet_id, orbits_around_id) VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 3);

