SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN (SELECT menu_id
        FROM person_order AS po
        JOIN person AS pr ON (po.person_id = pr.id)
        WHERE pr.name IN ('Denis', 'Anna')) AS tmp ON (menu_id = menu.id)
JOIN pizzeria ON (menu.pizzeria_id = pizzeria.id)
ORDER BY 1, 2
;