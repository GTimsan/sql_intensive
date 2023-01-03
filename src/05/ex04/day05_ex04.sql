CREATE UNIQUE INDEX IF NOT EXISTS idx_menu_unique ON menu (pizzeria_id, pizza_name);
set enable_seqscan = off;
EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name FROM menu WHERE pizzeria_id = 1 AND pizza_name = 'supreme pizza';
-- INSERT INTO menu VALUES (22, 1, 'supreme pizza');