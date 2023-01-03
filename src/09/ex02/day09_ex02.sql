CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit ()
RETURNS trigger AS
    $$
    BEGIN
       INSERT INTO person_audit(id, created, type_event, row_id, name, age, gender, address)
       VALUES ((SELECT coalesce(max(id) + 1, 1)  FROM person_audit), current_timestamp, 'D', OLD.*);
       RETURN NULL;
    END;
    $$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;