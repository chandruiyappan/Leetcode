WITH get_prev_temp AS (SELECT *,LAG(temperature) OVER(ORDER BY recordDate) AS previous_temp,
LAG(recordDate) OVER(ORDER BY recordDate) AS previous_day FROM Weather)
SELECT id FROM get_prev_temp
WHERE temperature > previous_temp
AND DATEDIFF(DAY,previous_day,recordDate) = 1

