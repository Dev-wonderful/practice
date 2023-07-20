-- Create user to query the database from your code
CREATE USER IF NOT EXISTS 'dev'@'localhost' IDENTIFIED BY 'dev_root';
GRANT SELECT ON `performance_schema`.* TO 'dev'@'localhost';
GRANT ALL PRIVILEGES ON `test_db`.* TO 'dev'@'localhost';
