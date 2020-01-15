SELECT * FROM flight;
SELECT origin, destination FROM flight;
SELECT * FROM flight WHERE id=3;
SELECT * FROM flight WHERE origin='New York';
SELECT * FROM flight WHERE duration > 500;
SELECT * FROM flight WHERE destination = 'Paris' AND duration > 500;
SELECT * FROM flight WHERE destination = 'Paris' OR duration > 500;

SELECT AVG(duration) FROM flight;
SELECT AVG(duration) FROM flight WHERE origin='New York';
SELECT COUNT(*) FROM flight;
SELECT COUNT(*) FROM flight WHERE origin='New York';
SELECT MIN(duration) FROM flight;
SELECT * FROM flight WHERE origin IN ('New York', 'Lima');
SELECT * FROM flight WHERE origin LIKE '%a%';

SELECT * FROM flight ORDER BY duration ASC LIMIT 3;

SELECT origin, COUNT(*) FROM flight GROUP BY origin;
SELECT origin, COUNT(*) FROM flight GROUP BY origin HAVING COUNT(*) > 1;

SELECT flight_id FROM passenger GROUP BY flight_id HAVING COUNT(*) > 1;
