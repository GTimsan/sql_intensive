SELECT m.pizza_name, pz.name AS pizzeria_name, m.price
FROM menu AS m
JOIN pizzeria AS pz ON (m.pizzeria_id = pz.id)
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1, 2
;
