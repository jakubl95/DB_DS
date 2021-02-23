-- Przekopiuj wszystkie tabele wraz z danymi od użytkownika HR
CREATE TABLE employees AS SELECT * FROM hr.employees;
CREATE TABLE departments AS SELECT * FROM hr.departments;
CREATE TABLE job_history AS SELECT * FROM hr.job_history;
CREATE TABLE jobs AS SELECT * FROM hr.jobs;
CREATE TABLE locations AS SELECT * FROM hr.locations;
CREATE TABLE countries AS SELECT * FROM hr.countries;
CREATE TABLE regions AS SELECT * FROM hr.regions;

-- Poustawiaj klucze główne i obce
ALTER TABLE regions ADD PRIMARY KEY(region_id);
ALTER TABLE countries ADD PRIMARY KEY(country_id);
ALTER TABLE countries ADD FOREIGN KEY(region_id) REFERENCES regions(region_id);
ALTER TABLE locations ADD PRIMARY KEY(location_id);
ALTER TABLE locations ADD FOREIGN KEY(country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD PRIMARY KEY(department_id);
ALTER TABLE departments ADD FOREIGN KEY(location_id) REFERENCES locations(location_id);
ALTER TABLE departments ADD FOREIGN KEY(manager_id) REFERENCES employees(employee_id);
ALTER TABLE employees ADD PRIMARY KEY(employee_id);
ALTER TABLE employees ADD FOREIGN KEY(department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY(manager_id) REFERENCES employees(employee_id);
ALTER TABLE employees ADD FOREIGN KEY(job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD PRIMARY KEY(employee_id, start_date);
ALTER TABLE job_history ADD FOREIGN KEY(department_id) REFERENCES departments(department_id);
ALTER TABLE job_history ADD FOREIGN KEY(employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY(job_id) REFERENCES jobs(job_id);
ALTER TABLE jobs ADD PRIMARY KEY(job_id);

-- Stwórz następujące perspektywy lub zapytania, dodaj wszystko do swojego repozytorium

-- 1.
SELECT CONCAT(last_name, CONCAT(' ', salary)) AS wynagrodzenie
FROM employees
WHERE department_id IN (20, 50)
AND salary BETWEEN 2000 AND 7000
ORDER BY last_name

-- 2.
SELECT hire_date, last_name, &&column_name
FROM employees
WHERE manager_id IN (
	SELECT employee_id
	FROM employees 
	WHERE hire_date LIKE '%-05' 
)
ORDER BY &&column_name;

-- 3.
SELECT CONCAT(first_name, CONCAT(' ', last_name)), salary, phone_number
FROM employees
WHERE last_name LIKE '__e%'
AND first_name LIKE '%&first_name_substring%'
ORDER BY 1 DESC, 2 ASC;

-- 4.
SELECT first_name, last_name, (round(MONTHS_BETWEEN(SYSDATE, hire_date))) as months_hired,
CASE 
    WHEN ((round(MONTHS_BETWEEN(SYSDATE, hire_date))) < 150) THEN 0.1 * salary
    WHEN ((round(MONTHS_BETWEEN(SYSDATE, hire_date))) BETWEEN 150 AND 200) THEN 0.2 * salary
    ELSE 0.3 * salary
END as wysokość_dodatku
FROM employees
ORDER BY months_hired;





















