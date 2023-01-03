SELECT DISTINCT person_id 
FROM person_visits 
WHERE visit_date BETWEEN '1.06.2022' AND '1.09.2022' OR pizzeria_id = 2
ORDER BY person_id DESC;