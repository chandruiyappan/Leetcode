WITH RankedSalaries AS (
    SELECT 
        DISTINCT salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
)

SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM RankedSalaries WHERE rnk = 2)
        THEN (SELECT salary FROM RankedSalaries WHERE rnk = 2)
        ELSE NULL
    END AS SecondHighestSalary;
