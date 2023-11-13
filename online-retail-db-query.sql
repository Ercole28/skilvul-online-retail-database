-- Table Creation
CREATE TABLE users(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    UNIQUE (username)
);
CREATE TABLE user_addresses(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    address_name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    postal_code VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    transaction_date DATE NOT NULL,
    total_amount BIGINT NOT NULL
);
CREATE TABLE transaction_items(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity BIGINT NOT NULL,
    sub_total BIGINT NOT NULL
);

CREATE TABLE payments(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount BIGINT NOT NULL,
    payment_method VARCHAR(255) NOT NULL
);
CREATE TABLE shipments(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    shipment_date DATE NOT NULL,
    shipment_status ENUM('PENDING', 'IN_TRANSIT', 'DELIVERED') NOT NULL
);

CREATE TABLE products(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price BIGINT NOT NULL,
    quantity BIGINT NOT NULL
);
CREATE TABLE product_categories(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE product_category_map(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL
);

-- Drop Table
DROP TABLE users;
DROP TABLE user_addresses;
DROP TABLE transactions;
DROP TABLE transaction_items;
DROP TABLE payments;
DROP TABLE shipments;
DROP TABLE products;
DROP TABLE product_categories;
DROP TABLE product_category_map;

-- Show All Tables
SHOW TABLES;

-- Alter Table for Foreign Key
ALTER TABLE
    user_addresses ADD FOREIGN KEY(user_id) REFERENCES users(id);

ALTER TABLE
    payments ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);

ALTER TABLE
    shipments ADD FOREIGN KEY(address_id) REFERENCES user_addresses(id);
ALTER TABLE
    shipments ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);

ALTER TABLE
    transactions ADD FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE
    transaction_items ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);
ALTER TABLE
    transaction_items ADD FOREIGN KEY(product_id) REFERENCES products(id);

ALTER TABLE
    product_category_map ADD FOREIGN KEY(product_id) REFERENCES products(id);
ALTER TABLE
    product_category_map ADD FOREIGN KEY(category_id) REFERENCES product_categories(id);

