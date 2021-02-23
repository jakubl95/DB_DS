1.
SELECT d.department_name, e.first_name, e.last_name, MAX(e.salary) FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY e.salary DESC;

2.
CREATE TABLE mecz(
	gospodarz varchar(255),
	gosc varchar(255),
	gole_gospodarza int unsigned,
	gole_goscia int unsigned
);
INSERT ALL
	INTO mecz VALUES ('Jedynaki', 'Dwojki', 2 , 1)
	INTO mecz VALUES ('Jedynaki', 'Trojzeby', 0 , 0)
	INTO mecz VALUES ('Czteropaki', 'Jedynaki', 1 , 3)
	INTO mecz VALUES ('Trojzeby', 'Dwojki', 6 , 3)
	INTO mecz VALUES ('Dwojki', 'Czteropaki', 1 , 0)
	INTO mecz VALUES ('Trojzeby', 'Czteropaki', 2 , 1)
	INTO mecz VALUES ('Dwojki', 'Jedynaki', 5 , 2)
	INTO mecz VALUES ('Trojzeby', 'Jedynaki', 2 , 3)
	INTO mecz VALUES ('Jedynaki', 'Czteropaki', 1 , 1)
	INTO mecz VALUES ('Dwojki', 'Trojzeby', 4 , 1)
	INTO mecz VALUES ('Czteropaki', 'Dwojki', 2 , 0)
	INTO mecz VALUES ('Czteropaki', 'Trojzeby', 2 , 0)
SELECT * FROM dual;

3.
DECLARE
  CURSOR c_mecz
  IS
    SELECT 
        *
    FROM 
        mecz;
BEGIN
  FOR r_mecz IN c_mecz
  LOOP
    
  END LOOP;
END;