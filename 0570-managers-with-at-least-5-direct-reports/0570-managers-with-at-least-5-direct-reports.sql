WITH get_direct_report AS
(SELECT  managerId,COUNT(id) AS numof_Direct_reports FROM Employee 
GROUP BY managerId) 

SELECT e.name FROM get_direct_report g
JOIN Employee e ON  g.managerId = e.id
WHERE numof_Direct_reports >=5
