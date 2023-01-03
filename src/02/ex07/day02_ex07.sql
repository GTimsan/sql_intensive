SELECT pz.name
FROM person_visits AS po
JOIN person AS pr ON (po.person_id = pr.id)
JOIN pizzeria AS pz ON (pz.id = po.pizzeria_id)
JOIN menu AS m ON (m.pizzeria_id = po.pizzeria_id)
WHERE pr.name = 'Dmitriy' 
    AND visit_date = '2022-01-08' 
    AND m.price < 800
;