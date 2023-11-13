CREATE TABLE payments(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_amount BIGINT NOT NULL,
    payment_method VARCHAR(255) NOT NULL
);

ALTER TABLE
    payments ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);