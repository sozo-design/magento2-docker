# Create the SQL user for accessing the WordPress database
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON `wordpress`.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;