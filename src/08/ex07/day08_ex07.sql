BEGIN; --S1
BEGIN; --S2

UPDATE pizzeria SET rating = 3 WHERE id = 1; --S1

UPDATE pizzeria SET rating = 3 WHERE id = 2; --S2

UPDATE pizzeria SET rating = 3 WHERE id = 2; --S1

UPDATE pizzeria SET rating = 3 WHERE id = 1; --S2

COMMIT; --S1
COMMIT; --S2