SELECT customer_id,Count(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL 
GROUP BY customer_id
ORDER BY customer_id ASC