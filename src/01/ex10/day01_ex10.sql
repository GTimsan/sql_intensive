SELECT person.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON (person_id = person.id)
JOIN menu ON (menu.id = person_order.menu_id)
JOIN pizzeria ON (pizzeria.id = menu.pizzeria_id)
ORDER BY 1, 2, 3
;