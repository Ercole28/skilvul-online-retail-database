-- | --- Case 2. Melihat 3 produk yang paling sering dibeli oleh pelanggan. --- |
SELECT
    products.id,
    products.name AS ProductName,
    COUNT(transaction_items.id) AS PurchaseCount
FROM
    products
JOIN
    transaction_items ON products.id = transaction_items.product_id
JOIN
    transactions ON transaction_items.transaction_id = transactions.id
GROUP BY
    products.id
ORDER BY
    PurchaseCount DESC
LIMIT 3;