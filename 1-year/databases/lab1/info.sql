1. Constraints 
- ограничение (внутри столбца/внутри таблицы)

ALTER TABLE nameOfTable ADD CONSTRAINT unique_email_address UNIAUE(email);

CREATE TABLE items (
	number INT CHECK(number > 0) UNIQUE NOT NULL,
	price INT CONSTRAINT not_negative CHECK(price >= 0),
	CONSTRINT wtf (number <= 10000),
	PRIMARY KEY (number, price)
);

Удалить:
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;


2. PK, FK

Primary key = not null unique (но только 1 в таблице)

CREATE TABLE items (
	id INT PRIMARY KEY,
	type INT REFERENCES another(id) ON DELETE RESTRICT,
	constraint fk_tests_students
     foreign key (highestStudent_id) 
     REFERENCES students (student_id)

);
"ON DELETE RESTRICT" - запретить удаление
"ON UPDATE RESTRICT" - запретить изменение
"ON DELETE CASCADE" - удаление каскадно
"ON UPDATE CASCADE" - изменение каскадно

3. Cascade 

DROP TABLE users CASCADE;
ALTER TABLE orders DROP CONSTRAINT orders_user_id_fkey CASCADE;
DROP DATABASE mydb CASCADE;


4. domain
- тип данных с дополнительными условиями

CREATE DOMAIN us_postal_code AS TEXT
CHECK(
   VALUE ~ '^\d{5}$'
OR VALUE ~ '^\d{5}-\d{4}$'
);

CREATE TABLE us_snail_addy (
  address_id SERIAL PRIMARY KEY,
  street1 TEXT NOT NULL,
  street2 TEXT,
  street3 TEXT,
  city TEXT NOT NULL,
  postal us_postal_code NOT NULL
);

5. Enum
CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');

имеется возможность добавлять новые значения в существующий тип-перечисление и переименовывать значения (см. ALTER TYPE). Однако удалять существующие значения из перечисления, а также изменять их порядок, нельзя

Значение enum занимает на диске 4 байта. Длина текстовой метки значения ограничена параметром компиляции NAMEDATALEN; в стандартных сборках Postgres Pro он ограничивает длину 63 байтами.

Сопоставления внутренних значений enum с текстовыми метками хранятся в системном каталоге pg_enum.

alter type enumio rename value 'p' to 'o';

6. Seq + Serial
CREATE SEQUENCE serial START 101;
SELECT nextval('serial');
Создание возрастающей последовательности с именем serial, с начальным значением 101:

CREATE SEQUENCE serial START 101;
Получение следующего номера этой последовательности:

SELECT nextval('serial');

Получение следующего номера этой последовательности:

SELECT nextval('serial');

Использование этой последовательности в команде INSERT:

INSERT INTO distributors VALUES (nextval('serial'), 'nothing');

CREATE SEQUENCE my_sequence
    START 100  -- Начальное значение
    INCREMENT 10  -- Шаг увеличения
    MINVALUE 50  -- Минимальное значение
    MAXVALUE 1000  -- Максимальное значение
    CYCLE;  -- Зацикливание (когда достигает MAX, начинает с MIN)

ALTER SEQUENCE my_sequence
    INCREMENT BY 5
    MINVALUE 10
    MAXVALUE 1000
    RESTART WITH 50;  -- Следующее значение будет 50


7. Truncate

Команда TRUNCATE выполняет очистку таблицы в массовом порядке и отличается высокой скоростью выполнения. Эта команда удаляет все строки, не позволяя указывать условия, и при этом не регистрирует каждое изменение в журнале. Помимо этого, TRUNCATE сбрасывает автоинкрементные счётчики, если таковые присутствуют в таблице.


В отличие от TRUNCATE, команда DELETE предоставляет гораздо большую гибкость: она позволяет выставлять ряд условий (WHERE) для удаления определенных строк, использовать откат операций и отслеживать каждое удаление.

Если таблица участвует во внешнем ключевом ограничении, выполнять TRUNCATE не получится, в отличие от DELETE, которое возможно при соблюдении ключевого условия.



SELECT 
    users.id, 
    users.name, 
    COUNT(DISTINCT l1.id_to) AS sent_likes, 
    COUNT(DISTINCT l2.id_from) AS received_likes, 
    (SELECT COUNT(*) 
     FROM likes AS ltmp 
     WHERE ltmp.id_from = l1.id_to AND ltmp.id_to = users.id) AS mutual_likes
FROM users
LEFT JOIN likes AS l1 ON l1.id_from = users.id  -- Лайки, отправленные пользователем
LEFT JOIN likes AS l2 ON l2.id_to = users.id  -- Лайки, полученные пользователем
GROUP BY users.id, users.name;



create table someTable (
	id serial primary key,
	user_id INT NOT NULL,
	constraint fk foreign key(user_id) references users(id)
);

