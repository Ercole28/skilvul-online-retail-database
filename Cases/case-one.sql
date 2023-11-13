-- | --- Case 1. Pelanggan Membeli 3 Barang yang Berbeda --- |

-- 1. Buat Transaksi Terlebih Dahulu Pada tanggal 13 November 2023 akan menjadi Id ke 15
INSERT INTO transactions (user_id, transaction_date, total_amount)
VALUES 
    (1, '2023-11-13', 0);

-- 2. Membeli 3 Barang didalam 1 Tranksasi
INSERT INTO transaction_items (transaction_id, product_id, quantity, sub_total)
VALUES 
    (15, 21, 2, 760000),
    (15, 18, 1, 48420),
    (15, 8, 1, 350000);

-- 3. Update Total Amount pada Transaction berdasarkan 3 barang yang memiliki id = 15
UPDATE transactions
SET total_amount = 1158420
WHERE id = 15;

-- 4. Membuat payment berdasarkan id = 15
INSERT INTO payments (transaction_id, payment_date, payment_amount, payment_method)
VALUES 
    (15, '2023-11-13', 1158420, 'VA Mandiri');

-- 5. Ketika Payment telah berhasil dilakukan maka buat record pengiriman, user dapat memilih address ingin mereka tuju sesuai dengan alamat yang mereka miliki
INSERT INTO shipments (transaction_id, address_id, shipment_date, shipment_status)
VALUES
    (15, 1,'2023-11-14', 'PENDING');

-- 6. Update status ketika produk sedang dikirim
UPDATE shipments
SET shipment_status = 'IN_TRANSIT'
WHERE transaction_id = 15;

-- 7. Update status ketika produk telah sampai di tujuan
UPDATE shipments
SET shipment_status = 'DELIVERED'
WHERE transaction_id = 15;

