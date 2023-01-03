CREATE VIEW v_price_with_discount AS (
    SELECT pr.name AS name, m.pizza_name, m.price, round(m.price - m.price*0.1)::integer AS discount_price
FROM person_order AS po
JOIN person AS pr ON (po.person_id = pr.id)
JOIN menu AS m ON (m.id = po.menu_id)
ORDER BY 1, 2)
;