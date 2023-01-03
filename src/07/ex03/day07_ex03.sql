SELECT name, count(date) AS total_count
FROM (SELECT name, visit_date AS date
    FROM pizzeria
    JOIN person_visits ON (pizzeria_id = pizzeria.id)
    UNION ALL
    SELECT name, order_date
    FROM pizzeria
    JOIN menu ON (menu.pizzeria_id = pizzeria.id)
    JOIN person_order ON (menu_id = menu.id)) AS tmp
GROUP BY name
ORDER BY 2 DESC, 1
;