begin; --Session #1

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --Session #2

commit; --Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --Session #2
