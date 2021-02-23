3.
CREATE TABLE nowa(
	liczba varchar(2)
);
 
FOR counter IN 1..10
LOOP
	IF counter NOT IN (4,6) THEN
		INSERT INTO nowa VALUES (counter);
	END IF;
END LOOP;