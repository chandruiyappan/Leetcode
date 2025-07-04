SELECT 
    p.project_id,
    CAST(ROUND(AVG(e.experience_years * 1.0), 2) AS FLOAT) AS average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;
