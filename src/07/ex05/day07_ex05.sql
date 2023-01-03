SELECT name
FROM person
WHERE id IN (SELECT person_id FROM person_order)
ORDER BY name;