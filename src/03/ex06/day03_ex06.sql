WITH CTE_pp AS
    (SELECT menu.id, menu.pizza_name, pizzeria.name pizzeria_name, menu.price
        FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)

SELECT
    m1.pizza_name pizza_name,
    m1.pizzeria_name pizzeria_name_1,
    m2.pizzeria_name pizzeria_name_2,
    m1.price price
FROM
    CTE_pp m1 JOIN CTE_pp m2 ON m1.pizza_name = m2.pizza_name
        AND m1.price = m2.price
        AND m1.pizzeria_name != m2.pizzeria_name
        AND m1.id > m2.id
ORDER BY pizza_name
;