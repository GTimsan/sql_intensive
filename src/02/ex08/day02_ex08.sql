SELECT pr.name 
FROM person AS pr
JOIN person_order AS po ON (pr.id = po.person_id) 
JOIN menu AS m ON (m.id = po.menu_id)
WHERE address IN ('Moscow', 'Samara') 
    AND gender = 'male'
    AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC
;