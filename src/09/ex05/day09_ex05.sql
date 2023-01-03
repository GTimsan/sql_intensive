DROP FUNCTION IF EXISTS fnc_persons_female, fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (if BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR) AS
    $$
    SELECT * FROM person WHERE gender = pgender;
    $$
LANGUAGE sql;

SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();