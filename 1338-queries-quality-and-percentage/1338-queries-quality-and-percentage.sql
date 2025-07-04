/* Write your T-SQL query statement below */
SELECT query_name,ROUND(AVG(rating * 1.00/ position),2) AS quality,
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.00 / COUNT(*),2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
