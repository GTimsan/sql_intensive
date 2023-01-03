CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
    SELECT pz.name
    FROM pizzeria AS pz
    JOIN person_visits AS pv ON (pv.pizzeria_id = pz.id)
    JOIN person AS pr ON (pr.id = pv.person_id)
    JOIN menu AS m ON (m.pizzeria_id = pz.id)
    WHERE pr.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price < 800)
;