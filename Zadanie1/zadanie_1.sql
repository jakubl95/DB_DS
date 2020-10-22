CREATE table Employees(
	employee_id int PRIMARY KEY, 
	first_name varchar(30) , 
	last_name varchar(30) , 
	email varchar(30) , 
	phone_number varchar(12) , 
	hire_date Date , 
	job_id int, 
	salary float , 
	commission_pct float,
	manager_id int, 
	department_id int, 
	CONSTRAINT fk_employees_employees FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

CREATE table Departments(
	department_id int PRIMARY KEY, 
	department_name varchar(255) , 
	manager_id int, 
	location_id int, 
	CONSTRAINT fk_departments_employees FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

ALTER TABLE Employees ADD CONSTRAINT fk_employees_departments FOREIGN KEY (department_id) REFERENCES Departments(department_id);

CREATE table Regions(
	region_id int PRIMARY KEY,
	region_name varchar(255)
);

CREATE table Countries(
	country_id int PRIMARY KEY, 
	country_name varchar(255), 
	region_id int, 
	CONSTRAINT fk_countries_regions FOREIGN KEY(region_id) REFERENCES Regions(region_id)
);

CREATE table Locations(
	location_id int  PRIMARY KEY, 
	street_address varchar(255) , 
	postal_code varchar(6) , 
	city varchar(255) , 
	state_province varchar(255), 
	country_id int, 
	CONSTRAINT fk_locations_countries FOREIGN KEY(country_id) REFERENCES Countries(country_id)
);

ALTER TABLE Departments ADD CONSTRAINT fk_departments_locations FOREIGN KEY(location_id) REFERENCES Locations(location_id);


CREATE TABLE Jobs(
	job_id int PRIMARY KEY,
	job_title varchar(255),
	min_salary float,
	max_salary float
);

ALTER TABLE Employees ADD CONSTRAINT fk_employees_jobs FOREIGN KEY (job_id) REFERENCES Jobs(job_id);

CREATE TABLE Job_history(
	employee_id int,
	start_date date,
	end_date date,
	job_id int,
	department_id int,
	PRIMARY KEY(employee_id, start_date),
	CONSTRAINT fk_job_history_jobs FOREIGN KEY(job_id) REFERENCES Jobs(job_id),
	CONSTRAINT fk_job_history_departments FOREIGN KEY(department_id) REFERENCES Departments(department_id),
	CONSTRAINT fk_job_history_employees FOREIGN KEY(employee_id) REFERENCES Employees(employee_id)
);
