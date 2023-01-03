SELECT pz.name, pz.rating
FROM pizzeria AS pz
LEFT OUTER JOIN person_visits AS pv ON (pz.id = pv.pizzeria_id)
WHERE pv.pizzeria_id IS NULL
;