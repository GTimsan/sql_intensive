SELECT action_date, pr.name AS person_name FROM (SELECT to_char(order_date, 'YYYY-MM-DD') AS action_date, person_id
FROM person_order
INTERSECT 
SELECT to_char(visit_date, 'YYYY-MM-DD'), person_id 
FROM person_visits) AS tmp_table
JOIN person AS pr ON (pr.id = person_id)
ORDER BY action_date ASC, 2 DESC
;
