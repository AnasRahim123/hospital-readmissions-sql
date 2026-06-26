CREATE DATABASE hospital_db;

CREATE TABLE patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    region VARCHAR(20),
    insurance_type VARCHAR(20)
);

CREATE TABLE admissions (
    patient_id VARCHAR(20),
    admission_date DATE,
    season VARCHAR(10),
    primary_diagnosis VARCHAR(50),
    comorbidities_count INT,
    length_of_stay INT,
    treatment_type VARCHAR(20),
    medications_count INT
);

CREATE TABLE outcomes (
    patient_id VARCHAR(20),
    followup_visits_last_year INT,
    prev_readmissions INT,
    discharge_disposition VARCHAR(20),
    readmission_risk_score NUMERIC(5,2),
    label INT
);

DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS admissions;
DROP TABLE IF EXISTS outcomes;

CREATE TABLE staging (
    patient_id VARCHAR(20),
    admission_date DATE,
    season VARCHAR(10),
    age INT,
    gender VARCHAR(10),
    region VARCHAR(20),
    primary_diagnosis VARCHAR(50),
    comorbidities_count INT,
    length_of_stay INT,
    treatment_type VARCHAR(20),
    medications_count INT,
    followup_visits_last_year INT,
    prev_readmissions INT,
    insurance_type VARCHAR(20),
    discharge_disposition VARCHAR(20),
    readmission_risk_score NUMERIC(5,2),
    label INT
);

DROP TABLE IF EXISTS staging;

CREATE TABLE patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    region VARCHAR(20),
    insurance_type VARCHAR(20)
);

CREATE TABLE admissions (
    patient_id VARCHAR(20),
    admission_date DATE,
    season VARCHAR(10),
    primary_diagnosis VARCHAR(50),
    comorbidities_count INT,
    length_of_stay INT,
    treatment_type VARCHAR(20),
    medications_count INT
);

CREATE TABLE outcomes (
    patient_id VARCHAR(20),
    followup_visits_last_year INT,
    prev_readmissions INT,
    discharge_disposition VARCHAR(20),
    readmission_risk_score NUMERIC(5,2),
    label INT
);

INSERT INTO patients (patient_id, age, gender, region, insurance_type)
SELECT patient_id, age, gender, region, insurance_type
FROM staging;

INSERT INTO admissions (patient_id, admission_date, season, primary_diagnosis, comorbidities_count, length_of_stay, treatment_type, medications_count)
SELECT patient_id, admission_date, season, primary_diagnosis, comorbidities_count, length_of_stay, treatment_type, medications_count
FROM staging;

INSERT INTO outcomes (patient_id, followup_visits_last_year, prev_readmissions, discharge_disposition, readmission_risk_score, label)
SELECT patient_id, followup_visits_last_year, prev_readmissions, discharge_disposition, readmission_risk_score, label
FROM staging;

SELECT * FROM patients LIMIT 5;
SELECT * FROM admissions LIMIT 5;
SELECT * FROM outcomes LIMIT 5;