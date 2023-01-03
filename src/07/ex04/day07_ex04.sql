SELECT name, count(visit_date) AS count_of_visits
FROM person
JOIN person_visits ON (person.id = person_visits.person_id)
GROUP BY name HAVING count(*) > 3