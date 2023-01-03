WITH CTE_shlyapa AS (SELECT missing_date::date
from generate_series(
        '2022-01-01',
        '2022-01-10',
        INTERVAL '1 day'
    )AS missing_date ),
    
    CTE_shlyapa2 AS (SELECT DISTINCT visit_date
        FROM person_visits
        WHERE person_id = 1
            OR person_id = 2)

    SELECT to_char(missing_date, 'YYYY-MM-DD') AS missing_date FROM CTE_shlyapa AS cte1
    LEFT JOIN 
    CTE_shlyapa2 AS visit_date 
    
    ON cte1.missing_date = visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;
