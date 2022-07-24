DROP DATABASE IF EXISTS craigslists;

CREATE DATABASE craigslists;

\c craigslists;

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL UNIQUE
);
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT not NULL UNIQUE,
    preferred_region_id  INTEGER REFERENCES regions
);
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT not null,
    description TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users, 
    regions_id INTEGER REFERENCES regions
);
CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT not NULL UNIQUE
);
CREATE TABLE post_category(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts,
    category_id INTEGER REFERENCES categories
);
INSERT INTO regions(city) VALUES
('San Francisco'),
('Atlanta'),
('Seattle');

INSERT INTO users(name, preferred_region_id) VALUES
('Aaron',1),
('Noah', 2),
('Paul', 3);
INSERT INTO posts(title, description, location, user_id, regions_id) VALUES
('All small cars for kids', 'used good conditon 1','802 Main st. CA, 75036', 1, 1),
('Coffee table', 'used good conditon 2','2896 Main rd. TX, 35029', 2, 3),
('Rug', 'used good conditon 3','789 Main Cr. CA, 895036', 3, 2),
('wall arts', 'used good conditon 4','759 Main st. CA, 33036', 1, 2);
INSERT INTO categories(category) VALUES
('toy'),
('furniture'),
('Home deco');
INSERT INTO post_category(post_id, category_id) VALUES
(1,1),
(2,2),
(3,3),
(3,2),
(4,3);

