BEGIN; --S1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --S1
SHOW TRANSACTION ISOLATION LEVEL; --S1

BEGIN; --S2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --S2
SHOW TRANSACTION ISOLATION LEVEL; --S2

SELECT sum(rating) FROM pizzeria; --S1

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --S2
COMMIT; --S2

SELECT sum(rating) FROM pizzeria; --S1
COMMIT; --S1
SELECT sum(rating) FROM pizzeria; --S1

SELECT sum(rating) FROM pizzeria; --S2
