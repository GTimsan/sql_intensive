CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR) AS
    $$
        SELECT * FROM person WHERE gender = 'female';
    $$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (id BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR) AS
    $$
        SELECT * FROM person WHERE gender = 'male';
    $$
LANGUAGE sql;

SELECT * FROM fnc_persons_female();
SELECT * FROM fnc_persons_male();