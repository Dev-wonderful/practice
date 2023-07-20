-- Create a test database
USE `test_db`;
-- no commas after the last datatype, otherwise error
CREATE TABLE IF NOT EXISTS `nexus6` (
	`id` INT,
	`name` VARCHAR(256)
);
INSERT INTO `test_table` (`id`, `name`)
VALUES (1, "Leon"),
VALUES (2, "Neon"),
VALUES (3, "Ade"),
VALUES (4, "Fadeyi"),
VALUES (5, "Christopher");
