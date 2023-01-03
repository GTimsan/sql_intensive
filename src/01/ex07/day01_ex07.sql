SELECT to_char(order_date, 'YYYY-MM-DD') AS order_date, CONCAT(p.name, '(age:', p.age, ')') AS person_information
FROM person_order
JOIN person AS p ON (p.id = person_id)
ORDER BY 1, 2
;