CREATE TABLE product_category_map(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL
);

ALTER TABLE
    product_category_map ADD FOREIGN KEY(product_id) REFERENCES products(id);
ALTER TABLE
    product_category_map ADD FOREIGN KEY(category_id) REFERENCES product_categories(id);