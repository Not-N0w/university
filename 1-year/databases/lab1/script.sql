-- Create
CREATE TABLE IF NOT EXISTS planet (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	temperature FLOAT4 CHECK(temperature > -273.15 AND temperature < 10000000),
	population BIGINT NOT NULL CHECK(population >= 0)
);

CREATE TABLE IF NOT EXISTS human (
	id SERIAL PRIMARY KEY,
	planet_id INTEGER REFERENCES planet(id),
	name VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL CHECK(birth_date >= '1950-01-01' AND birth_date <= CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS building (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_building DATE CHECK(date_of_building <= CURRENT_DATE),
	planet_id INTEGER REFERENCES planet(id) NOT NULL,
	owner_id INTEGER REFERENCES human(id)
);

CREATE TABLE IF NOT EXISTS house (
	id SERIAL PRIMARY KEY,
	building_id INTEGER REFERENCES building(id) NOT NULL,
	address VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS windmill (
	id SERIAL PRIMARY KEY,
	building_id INTEGER REFERENCES building(id) NOT NULL,
	performance FLOAT4 CHECK(performance >= 0 AND performance <= 1)
);

CREATE TABLE IF NOT EXISTS bridge (
	id SERIAL PRIMARY KEY,
	building_id INTEGER REFERENCES building(id) NOT NULL,
	lifting_capacity FLOAT4 CHECK(lifting_capacity >= 0)
);

CREATE TABLE IF NOT EXISTS spaceshipType (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	max_speed FLOAT8 NOT NULL CHECK(max_speed >= 0),
	fuel_consumption FLOAT8 NOT NULL CHECK(fuel_consumption >= 0)
);

CREATE TABLE IF NOT EXISTS spaceship (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	number_of_people_in INTEGER NOT NULL CHECK(number_of_people_in >= 0),
	going_to_planet_id INTEGER REFERENCES planet(id),
	spaceship_type_id INTEGER REFERENCES spaceshipType(id) NOT NULL
);

	
CREATE TABLE IF NOT EXISTS character (
	human_id INTEGER REFERENCES human(id) NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE IF NOT EXISTS journalist (
	human_id INTEGER REFERENCES human(id) NOT NULL UNIQUE,
	specialization VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS theme (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	relevance_factor FLOAT4 NOT NULL CHECK(relevance_factor >= 0 AND relevance_factor <= 100)
);

CREATE TABLE IF NOT EXISTS journalistTheme (
	journalist_id INTEGER REFERENCES journalist(human_id) NOT NULL,
	theme_id INTEGER REFERENCES theme(id) NOT NULL
);


-- Fill
INSERT INTO planet (name, temperature, population) VALUES
('Земля', 15.0, 7800000000),
('Ио', -150.0, 0),
('Марс', -60.0, 0),
('Венера', 465.0, 0),
('Титан', -180.0, 0);

INSERT INTO human (planet_id, name, birth_date) VALUES
(1, 'Курноу', '1980-05-15'),
(1, 'Анна Смит', '1990-07-22'),
(1, 'Джон Доу', '1985-03-10'),
(1, 'Мария Иванова', '1975-11-30'),
(1, 'Петр Петров', '1995-02-14');

INSERT INTO building (name, date_of_building, planet_id, owner_id) VALUES
('Обсерватория Ио', '5050-01-01', 2, 1),
('Дом Курноу', '5015-05-50', 1, 1),
('Мост на Ио', '5021-03-15', 2, 2),
('Ветряная мельница на Марсе', '5018-07-10', 3, 3),
('Мост на Венере', '5019-09-25', 4, 4);

INSERT INTO house (building_id, address) VALUES
(2, 'ул. Зеленая, д. 15'),
(4, 'ул. Красная, д. 10');

INSERT INTO windmill (building_id, performance) VALUES
(4, 0.85);

INSERT INTO bridge (building_id, lifting_capacity) VALUES
(3, 5000.0),
(5, 3000.0);

INSERT INTO spaceshipType (name, max_speed, fuel_consumption) VALUES
('Дискавери', 50000.0, 1000.0),
('Аполлон', 45000.0, 1500.0),
('Союз', 40000.0, 1100.0),
('Фалкон', 55000.0, 900.0),
('Орион', 60000.0, 800.0);

INSERT INTO spaceship (name, number_of_people_in, going_to_planet_id, spaceship_type_id) VALUES
('Дискавери-1', 5, 2, 1),
('Аполлон-2', 3, 3, 2),
('Союз-3', 4, 4, 3),
('Фалкон-4', 6, 5, 4),
('Орион-5', 7, 2, 5);

INSERT INTO character (human_id, description) VALUES
(1, 'Главный герой, журналист, исследующий тайны космоса'),
(2, 'Журналист, специализирующийся на научных открытиях'),
(3, 'Инженер, работающий на Ио'),
(4, 'Ученый, изучающий Венеру'),
(5, 'Пилот космического корабля');

INSERT INTO journalist (human_id, specialization) VALUES
(1, 'Космические исследования'),
(2, 'Научная журналистика'),
(4, 'Планетология');

INSERT INTO theme (name, relevance_factor) VALUES
('Тайны космоса', 0.95),
('Опасности Ио', 0.90),
('Исследования Марса', 0.85),
('Колонизация Венеры', 0.80),
('Технологии космических кораблей', 0.75);

INSERT INTO journalistTheme (journalist_id, theme_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(4, 5);