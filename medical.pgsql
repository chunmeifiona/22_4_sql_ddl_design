DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL

);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    birthday DATE
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);
CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients
);
CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases,
    notes TEXT
);

INSERT INTO doctors(name, specialty) VALUES
('Pat Norris','ob'),
('Marion Austin','pediatrician'),
('Glenn Fletcher','dentist');

INSERT INTO patients(name, birthday) VALUES
('Lucas Watkins', DATE '1985-02-15'),
('Ruth Wong',DATE '2017-01-10'),
('Jane Duncan',DATE '1956-05-03');

INSERT INTO diseases (disease) VALUES
('headakdjfgkjfl'),
('dentistkdfjlajfaggi'),
('djhfjahdflfgggg');

INSERT INTO visits(visit_date, doctor_id, patient_id) VALUES
( DATE '2022-03-15', 1, 3),
( DATE '2022-05-23', 2, 2),
( DATE '2022-05-24', 2, 3),
( DATE '2022-05-24', 2, 1),
( DATE '2022-06-05', 3, 3);

INSERT INTO diagnoses(visit_id, disease_id, notes) VALUES
(1, 2, 'fgajdhfladjl'),
(1, 3, 'jsthjlafhla'),
(2, 1, 'gjhjshgjshlg'),
(3, 2, 'fgshlkshglfhlg'),
(3, 1, 'hgshsghsfh');
