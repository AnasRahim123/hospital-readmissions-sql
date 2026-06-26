-- Query 1: Which diagnoses have the highest readmission rate?
SELECT 
    primary_diagnosis, 
    COUNT(*) AS total_patients,
    SUM(label) AS total_readmitted,
    ROUND(SUM(label) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM admissions
JOIN outcomes ON admissions.patient_id = outcomes.patient_id
GROUP BY primary_diagnosis
ORDER BY readmission_rate DESC;

-- Query 2: Does discharge disposition affect readmission rate?
SELECT 
    discharge_disposition, 
    COUNT(*) AS total_patients, 
    SUM(label) AS total_readmitted,
    ROUND(SUM(label) * 100.0 / COUNT(*), 2) AS readmission_rate 
FROM outcomes 
GROUP BY discharge_disposition 
ORDER BY readmission_rate DESC;

-- Query 3: Does length of stay affect readmission rate?
SELECT 
    length_of_stay, 
    COUNT(*) AS total_patients, 
    SUM(label) AS total_readmitted,
    ROUND(SUM(label) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM admissions
JOIN outcomes ON admissions.patient_id = outcomes.patient_id
GROUP BY length_of_stay 
ORDER BY readmission_rate DESC;