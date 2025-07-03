SELECT p.product_name, s.year, s.price
FROM Sales s
INNER JOIN Product p ON s.Product_id = p.Product_id
ORDER BY  p.product_name