WITH first_event_date AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity 
    GROUP BY player_id
)

SELECT  ROUND(SUM(CASE WHEN DATEADD(day, 1, f.first_login) = a.event_date THEN 1 ELSE 0 END) * 1.0/ COUNT(DISTINCT a.player_id ),2) AS fraction
FROM first_event_date f
JOIN Activity a
    ON f.player_id = a.player_id
