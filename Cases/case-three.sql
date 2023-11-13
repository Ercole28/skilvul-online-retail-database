-- | --- Case 3. Melihat Kategori barang yang paling banyak barangnya --- |
SELECT
    product_categories.id AS CategoryID,
    product_categories.name AS CategoryName,
    COUNT(product_category_map.product_id) AS ProductCount
FROM
    product_categories
JOIN
    product_category_map ON product_categories.id = product_category_map.category_id
GROUP BY
    product_categories.id
ORDER BY
    ProductCount DESC
LIMIT 1;