CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit ()
RETURNS trigger AS
    $$
    BEGIN
       INSERT INTO person_audit(id, created, type_event, row_id, name, age, gender, address)
       VALUES ((SELECT coalesce(max(id) + 1, 1)  FROM person_audit), current_timestamp, 'U', OLD.*);
       RETURN NULL;
    END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;