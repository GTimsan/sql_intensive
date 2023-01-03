SELECT 
        COALESCE(pr.name, '-')AS person_name, 
        to_char(visit_date, 'YYYY-MM-DD') AS visit_date,
        COALESCE(pz.name, '-') AS pizzeria_name
FROM person AS pr
FULL OUTER JOIN (SELECT * 
            FROM person_visits 
            WHERE visit_date 
            BETWEEN '2022-01-01' AND '2022-01-03')
            AS pv ON (pv.person_id = pr.id)
FULL OUTER JOIN pizzeria AS pz ON (pz.id = pv.pizzeria_id)
ORDER BY 1, 2, 3
;