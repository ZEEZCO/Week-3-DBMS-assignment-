-- 1.1 	Total_number_of_patients_admitted
SELECT
	COUNT(patient_id) AS total_patient_no
    FROM admissions;
    
-- 1.2 	Average_length_of_patience_stay
SELECT
	AVG(DATEDIFF(discharge_date, admission_date))
	AS average_legnth_of_stay
	FROM admissions, discharges;



-- 2.1  Group_admissions_by_primary_diagnosis
SELECT
	primary_diagnosis,
	COUNT(primary_diagnosis) AS each_diag
FROM admissions
GROUP BY primary_diagnosis;

-- 2.2	group_admissions_by_service_and_avg_length_of_stay
SELECT
	service,
	AVG(DATEDIFF(discharge_date, admission_date)) AS average_legth_of_stay
	FROM discharges, admissions
	GROUP BY service;

-- 2.3 total_discharged_per_disposition
SELECT
	discharge_disposition, COUNT(discharges_id) AS total_discharged_per_disposition
	FROM discharges
	GROUP BY discharge_disposition;
    


-- 3.1 group_admissions_by_service
SELECT COUNT(admission_id) AS total_adm_no, service
	FROM admissions
    WHERE admission_id > '5'
	GROUP BY service;

-- 3.2 avg_length_of_patient
SELECT
AVG(DATEDIFF(discharge_date, admission_date))  AS avg_stroke_stay_length
FROM discharges, admissions
WHERE primary_diagnosis = 'Stroke';



-- 4.1 group_emergency_department_visits
SELECT
	acuity, COUNT(*) AS ed_visit_acuity
	FROM ed_visits
	GROUP BY acuity;

-- 4.2 group_admissions_by_primary_diagnosis_and_service
SELECT
	COUNT(*) AS grp_serv,primary_diagnosis, service FROM admissions
	GROUP BY primary_diagnosis, service;

-- 5.1 total_admissions_by_month
SELECT
	DATE_FORMAT(admission_date, "%Y-%M") AS admission_date,
	COUNT(admission_id) AS total_admission
	FROM admissions
	GROUP BY DATE_FORMAT( admission_date, "%Y-%M");

-- 5.2 max_length_of_stay_for_each_P_diagnosis
SELECT
	MAX(DATEDIFF(discharge_date, admission_date)) AS maximum_length_of_stay,
	primary_diagnosis
	FROM discharges, admissions GROUP BY primary_diagnosis;

-- Optional
SELECT
	service,
	SUM(DATEDIFF(discharge_date, admission_date)) AS total_length_of_stay,
    AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay,
    COUNT(DATEDIFF(discharge_date, admission_date)) AS Number_of_length_of_stay
    FROM discharges, admissions
	GROUP BY service ORDER BY AVG(DATEDIFF(discharge_date, admission_date)) DESC;