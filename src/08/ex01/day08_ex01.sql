SHOW TRANSACTION ISOLATION LEVEL; --Session#1
SHOW TRANSACTION ISOLATION LEVEL; --Session#2

BEGIN; --Session#1
BEGIN; --Session#2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --Session#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --Session#2

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --S1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --S2 завис апдейт

COMMIT; --S1 отлип апдейт из S2
COMMIT; --S2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --S2