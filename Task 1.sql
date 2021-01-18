CREATE TABLE duck (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	show TEXT NOT NULL,
	studio TEXT NOT NULL,
	notes TEXT NOT NULL
);

-- IMPORTS ALL DATA FROM CSV FILE
COPY duck(name, show, studio, notes)
FROM 'C:\list-of-fictional-ducks-in-animation-wikipedia.csv'
DELIMITER ','
CSV HEADER;
