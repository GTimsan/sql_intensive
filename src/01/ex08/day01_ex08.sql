SELECT order_date, CONCAT(p.name, '(age:', p.age, ')') AS person_information
FROM (SELECT to_char(order_date, 'YYYY-MM-DD') AS order_date, person_id AS id
FROM person_order) AS o
NATURAL JOIN person AS p
ORDER BY order_date, person_information
;