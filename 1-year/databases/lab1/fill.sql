INSERT INTO planet (name, temperature, population) VALUES
('Earth', 15.0, 7800000000),
('Io', -150.0, 0),
('Mars', -63.0, 1000),
('Jupiter', -145.0, 0);

INSERT INTO human (planet_id, name, birth_date) VALUES
(1, 'John Kurnow', '1985-07-15'),
(1, 'Alice Smith', '1990-03-22'),
(3, 'Bob Johnson', '1975-11-30');

INSERT INTO building (name, date_of_building, planet_id, owner_id) VALUES
('Discovery', '2020-01-01', 1, 1),
('Mars Colony HQ', '2030-05-10', 3, 3),
('Io Research Station', '2025-08-20', 2, NULL);

INSERT INTO house (building_id, address) VALUES
(2, '1 Mars Colony Street'),
(1, 'Orbiting Earth');

INSERT INTO windmill (building_id, performance) VALUES
(3, 500.0);

INSERT INTO bridge (building_id, lifting_capacity) VALUES
(1, 10000.0);

INSERT INTO spaceshipType (name, max_speed, fuel_consumption) VALUES
('Explorer', 50000.0, 200.0),
('Colonizer', 30000.0, 150.0);

INSERT INTO spaceship (name, number_of_people_in, going_to_planet_id, spaceship_type_id) VALUES
('Discovery', 5, 2, 1),
('Mars Shuttle', 10, 3, 2);

INSERT INTO character (human_id, description) VALUES
(1, 'Some description.'),
(2, 'Some description.');

INSERT INTO journalist (human_id, specialization) VALUES
(1, 'Space Exploration'),
(2, 'Planetary Science');

INSERT INTO theme (name, relevance_factor) VALUES
('Space Mysteries', 9.5),
('Planetary Colonization', 8.7),
('Alien Life', 7.8);

INSERT INTO journalistTheme (journalist_id, theme_id) VALUES
(1, 1),
(1, 3),
(2, 2);