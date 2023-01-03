CREATE TABLE IF NOT EXISTS person_audit (
  id BIGINT PRIMARY KEY NOT NULL,
  created TIMESTAMPTZ DEFAULT current_timestamp NOT NULL,
  type_event CHAR(1) DEFAULT 'I' NOT NULL
        constraint ch_type_event
            check ((type_event) = ANY ((ARRAY ['I', 'D', 'U']))),
  row_id BIGINT NOT NULL ,
  name VARCHAR,
  age INTEGER DEFAULT 10,
  gender VARCHAR DEFAULT 'female',
  address VARCHAR
  );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS
    $$
    BEGIN
       INSERT INTO person_audit(id, created, type_event, row_id, name, age, gender, address)
       VALUES ((SELECT coalesce(max(id) + 1, 1)  FROM person_audit), current_timestamp, 'I', NEW.*);
       RETURN NULL;
    END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

