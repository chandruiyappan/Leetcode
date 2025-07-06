WITH positive_tests AS (
    SELECT 
        patient_id,
        MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'positive'
    GROUP BY patient_id
),
negative_tests AS (
    SELECT 
        c.patient_id,
        MIN(c.test_date) AS first_negative_after_positive
    FROM covid_tests c 
    JOIN positive_tests p ON p.patient_id = c.patient_id
    WHERE c.result = 'negative' AND c.test_date > p.first_positive_date
    GROUP BY c.patient_id
)
SELECT 
    pt.patient_id,
    pa.patient_name,
    pa.age,
    DATEDIFF(DAY, pt.first_positive_date, nt.first_negative_after_positive) AS recovery_time
FROM positive_tests pt
JOIN negative_tests nt ON pt.patient_id = nt.patient_id
JOIN patients pa ON pt.patient_id = pa.patient_id
ORDER BY recovery_time ASC, patient_name ASC;
