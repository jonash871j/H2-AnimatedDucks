-- Creates function
-- The functions that gets called when log_data gets trigged
CREATE OR REPLACE FUNCTION TF_log_data()
RETURNS TRIGGER AS
$$
BEGIN
	-- Adds the old data from the column that changed into duck_audits table
	INSERT INTO duck_audits(name, notes, show, studio, changed_on)
	VALUES(OLD.name, OLD.notes, OLD.show, OLD.studio, CURRENT_TIMESTAMP);
	RETURN OLD;
END;
$$
LANGUAGE PLPGSQL;

-- Creates trigger
-- Gets called every time a column gets updated in duck table
CREATE TRIGGER TR_log_data
AFTER UPDATE ON duck
FOR EACH ROW
EXECUTE FUNCTION TF_log_data();

-- Updates duck table
UPDATE duck
SET name = 'test'
WHERE id = 1;

UPDATE duck
SET name = 'dummy'
WHERE id = 43;

UPDATE duck
SET name = 'dummy2'
WHERE id = 32;

-- Select
SELECT * FROM duck_audits

