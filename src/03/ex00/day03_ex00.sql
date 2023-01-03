SELECT m.pizza_name, m.price, pz.name, visit_date
FROM person_visits AS pv 
JOIN pizzeria AS pz ON (pv.pizzeria_id = pz.id)
JOIN menu AS m ON (m.pizzeria_id = pz.id)
WHERE person_id = (SELECT id FROM person WHERE name = 'Kate')
       AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3
;