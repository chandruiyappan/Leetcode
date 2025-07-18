/* Write your T-SQL query statement below */
WITH first_orders AS (SELECT customer_id,MIN(order_date) AS first_order_date
FROM Delivery
GROUP BY customer_id)

SELECT ROUND((SUM(CASE WHEN d.order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) *100.00 / COUNT(*)),2) AS immediate_percentage
FROM Delivery d 
JOIN first_orders f ON d.customer_id = f.customer_id AND d.order_date = f.first_order_date
