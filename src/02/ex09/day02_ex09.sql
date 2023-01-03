SELECT DISTINCT pn.name
FROM person AS pn
    JOIN person_order ON person_order.person_id = pn.id
    JOIN menu ON menu.id = person_order.menu_id
WHERE pn.gender = 'female'
    AND 'cheese pizza' IN (
        SELECT DISTINCT menu.pizza_name
        FROM person
            JOIN person_order ON person_order.person_id = pn.id
            JOIN menu ON menu.id = person_order.menu_id
        WHERE person.id = pn.id
    )
    AND 'pepperoni pizza' IN (
        SELECT DISTINCT menu.pizza_name
        FROM person
            JOIN person_order ON person_order.person_id = pn.id
            JOIN menu ON menu.id = person_order.menu_id
        WHERE person.id = pn.id
    )
ORDER BY 1
;