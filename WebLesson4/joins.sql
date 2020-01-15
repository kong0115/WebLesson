CREATE TABLE passenger(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  flight_id INTEGER REFERENCES flight
);

INSERT INTO passenger (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passenger (name, flight_id) VALUES ('Bob', 1);
INSERT INTO passenger (name, flight_id) VALUES ('Charlie', 2);
INSERT INTO passenger (name, flight_id) VALUES ('Dave', 2);
INSERT INTO passenger (name, flight_id) VALUES ('Erin', 4);
INSERT INTO passenger (name, flight_id) VALUES ('Frank', 6);
INSERT INTO passenger (name, flight_id) VALUES ('Grace', 6);

SELECT origin, destination, name FROM flight INNER JOIN passenger ON passenger.flight_id = flight.id;
SELECT origin, destination, name FROM flight JOIN passenger ON flight.id = passenger.flight_id;
SELECT origin, destination, name FROM flight JOIN passenger ON flight.id = passenger.flight_id WHERE name =  'Alice';
SELECT origin, destination, name FROM flight LEFT JOIN passenger ON flight.id = passenger.flight_id;
SELECT origin, destination, name FROM flight RIGHT JOIN passenger ON flight.id = passenger.flight_id;

SELECT origin, destination, name FROM flight LEFT OUTER JOIN passenger ON flight.id = passenger.flight_id;
SELECT origin, destination, name FROM flight RIGHT OUTER JOIN passenger ON flight.id = passenger.flight_id;
SELECT origin, destination, name FROM flight FULL OUTER JOIN passenger ON flight.id = passenger.flight_id;
