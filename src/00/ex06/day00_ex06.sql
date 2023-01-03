SELECT (SELECT name FROM person WHERE id = person_id) AS name,
(SELECT name FROM person WHERE id = person_id) = 'Denis' AS check_name
FROM person_order 
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '1.07.2022';