CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
    ON person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;
EXPLAIN ANALYSE
SELECT * FROM person_discounts ORDER BY person_id, pizzeria_id;
