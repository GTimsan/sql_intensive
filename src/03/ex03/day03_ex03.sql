SELECT name AS pizzeria_name 
FROM ((SELECT pv.pizzeria_id
       FROM person_visits AS pv
       JOIN person AS pr ON (pv.person_id = pr.id)
       WHERE gender = 'female'
       EXCEPT ALL
       SELECT pv.pizzeria_id
       FROM person_visits AS pv
       JOIN person AS pr ON (pv.person_id = pr.id)
       WHERE gender = 'male')
       UNION ALL
       (SELECT pv.pizzeria_id
       FROM person_visits AS pv
       JOIN person AS pr ON (pv.person_id = pr.id)
       WHERE gender = 'male'
       EXCEPT ALL
       SELECT pv.pizzeria_id
       FROM person_visits AS pv
       JOIN person AS pr ON (pv.person_id = pr.id)
       WHERE gender = 'female')) AS tmp
JOIN pizzeria ON (tmp.pizzeria_id = pizzeria.id)
ORDER BY 1
;
