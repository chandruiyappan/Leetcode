/* Write your T-SQL query statement below */
SELECT patient_id, patient_name,conditions
FROM Patients
WHERE ' ' + conditions + ' ' LIKE '% DIAB1%'