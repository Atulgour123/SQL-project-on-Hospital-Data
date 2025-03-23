CREATE DATABASE hospital;

CREATE TABLE hospitaldata(
		Hospital_Name VARCHAR(100),
		LOCATION VARCHAR(50),
		DEPARTMENT VARCHAR(50),
		DOCTORS_COUNT INT,
		PATIENTS_COUNT INT,
		ADMISSION_DATE DATE,
		DISCHARGE_DATE DATE,
		MEDICAL_EEXPENSES NUMERIC(10,2)

)

SELECT * FROM hospitaldata

COPY hospitaldata(
Hospital_Name,Location,Department,Doctors_Count,Patients_Count,Admission_Date,
Discharge_Date,Medical_Expenses
)
FROM 'D:\Hospital_Data.csv'
CSV HEADER

--1. Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(patients_count) AS total_patient
FROM hospitaldata

--2. Retrieve the average count of doctors available in each hospital.
SELECT AVG(doctors_count) AS avg_doctors_per_hospital
FROM hospitaldata;

--3.Find the top 3 hospital departments that have the highest number of patients.

SELECT department, SUM(patients_count) AS total_patients
FROM HospitalData
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

--4. Identify the hospital that recorded the highest medical expenses

SELECT hospital_name, SUM(medical_expenses) AS total_expenses
FROM hospitaldata
GROUP BY hospital_name
ORDER BY total_expenses DESC
LIMIT 1;
--5.Calculate the average medical expenses per day for each hospital.

SELECT hospital_name, AVG(medical_expenses / (discharge_date-admission_date)) AS avg_expenses_per_day
FROM hospitaldata
GROUP BY hospital_name;

--7. Count the total number of patients treated in each city
SELECT location, COUNT(*) AS Total_Patients
FROM hospitaldata
GROUP BY location
ORDER BY Total_Patients DESC;

--8. Calculate the average number of days patients spend in each department.

SELECT "department", 
       AVG("discharge_date" - "admission_date") AS Avg_Stay_Duration
FROM hospitaldata
GROUP BY "department"
ORDER BY Avg_Stay_Duration DESC;

--9. Find the department with the least number of patients.
SELECT "department", COUNT(*) AS Patient_Count
FROM hospitaldata
GROUP BY "department"
ORDER BY Patient_Count ASC
LIMIT 1;

--10.Group the data by month and calculate the total medical expenses for each month

SELECT 
    TO_CHAR("admission_date", 'YYYY-MM') AS Month,
    SUM("medical_expenses") AS Total_Medical_Expenses
FROM hospitaldata
GROUP BY Month
ORDER BY Month;




