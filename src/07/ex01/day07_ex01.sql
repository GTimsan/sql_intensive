 SELECT name, count(visit_date) AS count_of_visits
FROM person_visits
JOIN person ON (person_id = person.id)
GROUP BY name
ORDER BY 2 DESC, 1
LIMIT 4
;