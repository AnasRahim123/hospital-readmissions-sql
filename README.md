# Hospital Readmissions Analysis

## Overview
This project analyzes hospital readmission patterns using SQL and Tableau, exploring which factors most influence whether a patient returns to the hospital within 30 days. The analysis covers diagnosis type, discharge disposition, and length of stay across 8,000 synthetic patient records.

## Tools Used
- PostgreSQL
- SQL (JOIN, GROUP BY, CASE-style aggregation)
- Tableau Public

## Database Structure
The dataset was split into three relational tables to practice JOIN operations:
- **patients** – demographic info
- **admissions** – diagnosis, length of stay, treatment details
- **outcomes** – discharge disposition, readmission outcome

## Key Findings
1. **Sepsis** has the highest readmission rate among all diagnoses, at 86.92%
2. **Skilled Nursing** discharges have the highest readmission rate at 92.98%, higher than Home Health despite fewer total patients
3. **Length of stay** shows no consistent pattern with readmission risk — rates fluctuate across different stay durations rather than trending clearly up or down

## Dashboard
View the interactive Tableau dashboard here:
https://public.tableau.com/app/profile/anas.rahim/viz/HospitalReadmissionsAnalysis_17824342951480/Dashboard1

## Files
- `setup.sql` – database and table creation
- `queries.sql` – final analysis queries
