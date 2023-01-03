SELECT p.name,
       count(*) AS count_of_orders,
       round(avg(menu.price), 2),
       max(menu.price) AS max_price,
       min(menu.price) AS min_price
FROM person_order
JOIN menu ON (menu.id = person_order.menu_id)
JOIN pizzeria p ON (menu.pizzeria_id = p.id)
GROUP BY p.name
ORDER BY 1