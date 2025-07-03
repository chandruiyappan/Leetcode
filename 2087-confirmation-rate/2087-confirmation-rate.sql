WITH get_confirmed_messages AS (SELECT user_id,COUNT(user_id) AS Total_meassages,
SUM(CASE WHEN ACTION = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_messages
FROM Confirmations
GROUP BY user_id) 


SELECT s.user_id,ROUND(ISNULL(CAST(confirmed_messages AS FLOAT)/ Total_meassages,0),2) AS confirmation_rate
FROM Signups s
LEFT JOIN get_confirmed_messages c  ON s.user_id = c.user_id


