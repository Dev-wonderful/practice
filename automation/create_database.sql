-- Create a test database
CREATE DATABASE IF NOT EXISTS `test_db`;
USE `test_db`;
-- no commas after the last datatype, otherwise error
CREATE TABLE IF NOT EXISTS `test_table` (
	`id` INT,
	`name` VARCHAR(256)
);
INSERT INTO `test_table` (`id`, `name`)
VALUES (1, "Leon"),
	(2, "Neon"),
	(3, "Ade"),
	(4, "Fadeyi"),
	(5, "Christopher");
