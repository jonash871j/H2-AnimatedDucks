CREATE TABLE duck_audits (
	 id SERIAL PRIMARY KEY,
	 name TEXT NOT NULL,
	 notes TEXT NOT NULL,
	 show TEXT NOT NULL,
	 studio TEXT NOT NULL,
	 changed_on TIMESTAMP(6) NOT NULL
);