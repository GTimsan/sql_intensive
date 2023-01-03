BEGIN; --S1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --S1
SHOW TRANSACTION ISOLATION LEVEL; --S1

BEGIN; --S2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --S2
SHOW TRANSACTION ISOLATION LEVEL; --S2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S2

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --S1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --S2 завис

COMMIT; --S1
-- ERROR:  could not serialize access due to concurrent update На S2

COMMIT; --S2
-- ROLLBACK

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S2