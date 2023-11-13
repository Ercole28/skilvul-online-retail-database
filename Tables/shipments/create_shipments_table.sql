CREATE TABLE shipments(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    shipment_date DATE NOT NULL,
    shipment_status ENUM('PENDING', 'IN_TRANSIT', 'DELIVERED') NOT NULL
);

ALTER TABLE
    shipments ADD FOREIGN KEY(address_id) REFERENCES user_addresses(id);
ALTER TABLE
    shipments ADD FOREIGN KEY(transaction_id) REFERENCES transactions(id);