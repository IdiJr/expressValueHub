-- creates the express_value_hub schema
CREATE SCHEMA IF NOT EXISTS `express_value_hub`;

-- creates user called EVH and grants all privileges of express_value_hub to it
CREATE USER 'EVH'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON express_value_hub.* TO 'EVH'@'localhost';
FLUSH PRIVILEGES;

-- creates user_info table to store user details
CREATE TABLE `express_value_hub`.`user_info` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(300) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    business_name VARCHAR(300) NOT NULL,
    business_id VARCHAR(36) NOT NULL,
    description VARCHAR(700),
    business_address VARCHAR(500) NOT NULL
)

-- creates product_info table to store details of products
CREATE INDEX idx_user_info_business_id ON user_info (business_id);
CREATE TABLE `express_value_hub`.`product_info` (
    order_no INT NOT NULL AUTO_INCREMENT,
    business_id VARCHAR(36) NOT NULL,
    product_name VARCHAR(300) NOT NULL,
    price INT NOT NULL,
    per VARCHAR(10) NOT NULL DEFAULT "unit",
    product_status BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPADTE CURRENT_TIMESTAMP,
    PRIMARY KEY (order_no),
    FOREIGN KEY (business_id) REFERENCES user_info (business_id)
)
