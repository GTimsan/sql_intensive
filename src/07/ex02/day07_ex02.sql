(SELECT name, count(visit_date) AS count, 'visit' AS action_type
FROM pizzeria
JOIN person_visits ON (pizzeria_id = pizzeria.id)
GROUP BY name ORDER BY 2 DESC LIMIT 3)
UNION ALL
(SELECT name, count(order_date), 'order' AS action_type
FROM pizzeria
JOIN menu ON (menu.pizzeria_id = pizzeria.id)
JOIN person_order ON (menu_id = menu.id)
GROUP BY name ORDER BY 2 DESC LIMIT 3)
ORDER BY action_type, count DESC
;