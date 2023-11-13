CREATE TABLE transaction_items(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity BIGINT NOT NULL,
    sub_total BIGINT NOT NULL
);

ALTER TABLE
    transaction_items ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);
ALTER TABLE
    transaction_items ADD FOREIGN KEY(product_id) REFERENCES products(id);