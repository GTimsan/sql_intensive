SELECT pr.name AS name,
       pizza_name AS pizza_name,
       price AS price,
       price - (price / 100 * discount) AS discount_price,
       pz.name AS pizzeria_name
FROM person_order AS po
JOIN menu AS m ON (po.menu_id = m.id)
JOIN person AS pr ON (pr.id = po.person_id)
JOIN pizzeria AS pz ON (m.pizzeria_id = pz.id)
JOIN person_discounts AS pd ON (pd.person_id = pr.id AND pd.pizzeria_id = pz.id)
ORDER BY 1, 2
;