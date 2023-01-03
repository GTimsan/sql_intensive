SELECT m.pizza_name, m.price, pz.name AS pizzeria_name
FROM menu AS m
JOIN (SELECT id AS menu_id
       FROM menu
       EXCEPT
       SELECT menu_id
       FROM person_order) AS tmp ON (m.id = tmp.menu_id)
JOIN pizzeria AS pz ON (pz.id = m.pizzeria_id)
ORDER BY 1, 2
;