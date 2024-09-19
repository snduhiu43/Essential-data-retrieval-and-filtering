-- Assignment on Essential Data Retrieval & Filtering

-- Part 1: Basic Data Retrieval

USE hospital_db;

-- selcting records from patients table
SELECT first_name, last_name, date_of_birth
FROM patients;

-- selcting records from providers table
SELECT provider_id, first_name, provider_specialty
FROM providers;


-- Part 2: Pattern-Based Filtering

-- wildcard in use: patients names that start with Ab
SELECT *
FROM patients
WHERE first_name LIKE 'Ab%';

-- providers whose specialty ends in 'y'
SELECT *
FROM providers
WHERE provider_specialty LIKE '%y';


-- Part 3: Comparison Operators

-- patients born after 1st January 1980
SELECT *
FROM patients
WHERE date_of_birth > '1980-01-01';

-- retrieve visits where the acuity level is 2 or higher
SELECT *
FROM ed_visits
WHERE acuity >= '2';


-- Part 4: WHERE Clause with Logical Operators

-- patients who speak Spanish
SELECT *
FROM patients
WHERE language = 'Spanish';

-- visits where the reason is "Migraine" and the disposition is "Admitted"
SELECT *
FROM ed_visits
WHERE reason_for_visit = 'Migraine'
AND ed_disposition = 'Admitted';

-- patients born between 1975 and 1980
SELECT *
FROM patients
WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-12-31';


-- Part 5: Sorting Data

-- retrieve patient names and sort them in alphabetical order by last name
SELECT first_name, last_name
FROM patients
ORDER BY last_name ASC;

-- list all visits sorted by the date of the visit, starting from the most recent
SELECT *
FROM visits
ORDER BY date_of_visit DESC;


-- Part 6: Advanced Filtering

-- retrieve all admissions where the primary diagnosis is "Stroke" and the discharge disposition is "Home".
SELECT a.*
FROM admissions a
JOIN discharges d ON a.admission_id = d.admission_id
WHERE a.primary_diagnosis = 'Stroke'
AND d.discharge_disposition = 'Home';

-- providers who joined after 1995 and specialize in either Pediatrics or Cardiology
SELECT *
FROM providers
WHERE date_joined >= '1995-01-01'
AND (provider_specialty = 'Pediatrics' OR provider_specialty = 'Cardiology');


-- Bonus Challenge (optional)

-- all discharges where the patient was discharged home and the discharge date is within the first week of March 2018.
SELECT *
FROM discharges
WHERE discharge_disposition = 'Home'
AND discharge_date BETWEEN '2018-03-01' AND '2018-03-07';