TRUNCATE person_audit;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit,
    fnc_trg_person_update_audit,
    fnc_trg_person_delete_audit
CASCADE;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS trigger AS
    $$
        BEGIN
            IF (tg_op = 'INSERT') THEN
                INSERT INTO person_audit
                    SELECT (SELECT coalesce(max(id) + 1, 1) FROM person_audit), current_timestamp, 'I', NEW.*;
            ELSIF (tg_op = 'UPDATE') THEN
                INSERT INTO person_audit
                    SELECT (SELECT coalesce(max(id) + 1, 1) FROM person_audit), current_timestamp, 'U', OLD.*;
            ELSIF (tg_op = 'DELETE') THEN
                INSERT INTO person_audit
                    SELECT (SELECT coalesce(max(id) + 1, 1) FROM person_audit), current_timestamp, 'D', OLD.*;
            END IF;
            RETURN NULL;
        END;
    $$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
-- CREATE OR REPLACE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_audit();

INSERT INTO person VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
