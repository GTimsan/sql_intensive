INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over (),
       person_id,
       pizzeria_id,
       CASE WHEN count(*) = 1 THEN 10.5
            WHEN count(*) = 2 THEN 22
            ELSE 30
       END AS discount
FROM person_order
JOIN menu ON (menu_id = menu.id)
GROUP BY  (pizzeria_id, person_id)