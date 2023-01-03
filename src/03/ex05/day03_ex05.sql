SELECT pizzeria.name pizzeria_name
    FROM (SELECT id, name FROM person WHERE name = 'Andrey') person
        JOIN person_visits ON person.id = person_visits.person_id
            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
EXCEPT ALL
SELECT pizzeria.name pizzeria_name
    FROM (SELECT id, name FROM person WHERE name = 'Andrey') person
        JOIN person_order ON person.id = person_order.person_id
            JOIN menu ON person_order.menu_id = menu.id
                JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1;