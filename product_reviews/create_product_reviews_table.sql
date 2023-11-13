CREATE TABLE product_reviews(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    rating BIGINT NOT NULL,
    comment TEXT NOT NULL,
    review_date DATETIME NOT NULL
);

ALTER TABLE
    product_reviews ADD FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE
    product_reviews ADD FOREIGN KEY(product_id) REFERENCES products(id);