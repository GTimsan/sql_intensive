SELECT pr.id AS "person.id", pr.name AS "person.name", age, gender,
address, pz.id AS "pizzeria.id", pz.name AS "pizzeria.name", rating
FROM person AS pr
CROSS JOIN  pizzeria AS pz
ORDER BY "person.id", "pizzeria.id"
;