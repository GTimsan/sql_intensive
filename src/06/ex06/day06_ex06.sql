CREATE SEQUENCE seq_person_discounts
    AS BIGINT
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1;
SELECT SETVAL('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));
-- SELECT CURRVAL('seq_person_discounts');
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');
-- INSERT INTO person_discounts VALUES (DEFAULT, 3,3,5);