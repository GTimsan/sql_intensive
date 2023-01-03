SELECT to_char(missing_date::date, 'YYYY-MM-DD') AS missing_date
from generate_series(
        '2022-01-01',
        '2022-01-10',
        INTERVAL '1 day'
    ) AS missing_date
    LEFT JOIN (
        SELECT DISTINCT visit_date
        FROM person_visits
        WHERE person_id = 1
            OR person_id = 2
    ) AS visit_date ON missing_date = visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;