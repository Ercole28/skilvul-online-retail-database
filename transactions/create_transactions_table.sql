CREATE TABLE transactions(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    transaction_date DATETIME NOT NULL,
    total_amount BIGINT NOT NULL
);

ALTER TABLE
    transactions ADD FOREIGN KEY(user_id) REFERENCES users(id);