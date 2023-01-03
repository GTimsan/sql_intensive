SELECT
    (SELECT name FROM person WHERE id = pv.person_id) AS person_name,
    (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name
FROM (SELECT person_id, pizzeria_id FROM person_visits 
    WHERE visit_date BETWEEN '1.07.2022' AND '1.09.2022') AS pv
ORDER BY person_name ASC, pizzeria_name DESC;
