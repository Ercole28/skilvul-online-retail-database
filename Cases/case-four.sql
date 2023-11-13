-- | --- Case 4. Nominal rata-rata transaksi yang dilakukan oleh pelanggan dalam 1 bulan terakhir. --- |
SELECT
    AVG(total_amount) AS AverageTotalTransactionInOnMonth
FROM
    transactions
WHERE
    transaction_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH);