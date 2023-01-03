SELECT name 
FROM pizzeria 
WHERE id NOT IN (SELECT DISTINCT pizzeria_id FROM person_visits)
;

SELECT name 
FROM pizzeria AS pz
WHERE NOT EXISTS (SELECT pizzeria_id FROM person_visits WHERE pizzeria_id = pz.id)
;