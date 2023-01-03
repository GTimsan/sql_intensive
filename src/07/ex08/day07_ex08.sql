SELECT address, pizzeria.name, count(*) AS count_of_orders
FROM person
JOIN person_visits AS pv ON (pv.person_id = person.id)
JOIN pizzeria ON (pizzeria.id = pv.pizzeria_id)
JOIN (SELECT person_id, pizzeria_id, order_date
        FROM person_order
        JOIN menu ON (person_order.menu_id = menu.id)) AS tmp
    ON (tmp.person_id = pv.person_id AND tmp.pizzeria_id = pv.pizzeria_id)
GROUP BY pizzeria.name, address
ORDER BY 1, 2