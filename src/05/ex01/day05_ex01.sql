set enable_seqscan = off;
-- set enable_seqscan = on;

EXPLAIN ANALYSE
SELECT pizza_name, name AS pizzeria_name
FROM menu
JOIN pizzeria p on menu.pizzeria_id = p.id