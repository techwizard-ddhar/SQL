CREATE DATABASE DD_AIRLINES;

USE DD_AIRLINES;

CREATE TABLE airlines
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(90)
)
AUTO_INCREMENT = 100;

-- Insert a row, ID will be automatically generated
INSERT INTO airlines (name) VALUES ('United Airlines');

-- Get generated ID
SELECT LAST_INSERT_ID();
-- Returns: 100

INSERT INTO airlines (name) VALUES ('Indigo');
INSERT INTO airlines (name) VALUES ('Vistara');
INSERT INTO airlines (name) VALUES ('Air Asia');
INSERT INTO airlines (name) VALUES ('AirIndia');
INSERT INTO airlines (name) VALUES ('Spicejet');
INSERT INTO airlines (name) VALUES ('Go Air');

Select * from airlines;

SELECT last_insert_id();
------------------------------------------------------------------------------------------------------
INSERT INTO airlines VALUES (200, 'Lufthansa');

-- it will always takes the (last id) + 1.
INSERT INTO airlines (name) VALUES ('British Airways'); -- id 201 is assigned.

INSERT INTO airlines VALUES (150, 'Air France'); -- id 150 inserted
INSERT INTO airlines (name) VALUES ('KLM'); -- id 202 is assigned

-- it will always takes the (last id) + 1.
-- Specify NULL or 0.
INSERT INTO airlines VALUES (NULL, 'Southwest'); -- id 203 is assigned
INSERT INTO airlines VALUES (0, 'American Airlines'); -- id 204 is assigned
--------------------------------------------------------------------------------------------------------

INSERT IGNORE INTO airlines VALUES
(150, 'North Air'),
(0, 'Emirates'),
(NULL, 'Qatar Airways');

-- we cannot reset auto increment value less than or equal to current maximum id
ALTER TABLE airlines auto_increment = 1;
SELECT * FROM airlines;
-------------------------------------------------------------------------------------------
-- you can restart the auto_increment to 1 if there are no rows in a table

SET SQL_SAFE_UPDATES=0;
DELETE FROM airlines;
INSERT INTO airlines (name) VALUES ('United');


DELETE FROM airlines;
ALTER TABLE airlines AUTO_INCREMENT = 1;
INSERT INTO airlines (name) VALUES ('United'); -- id 1 is assigned
SELECT last_insert_id();
------------------------------------------------------------------------------------------------------

