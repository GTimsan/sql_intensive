INSERT INTO person_visits VALUES ((SELECT max(id) + 1 FROM person_visits),
                                  (SELECT id FROM person WHERE name = 'Dmitriy'),
                                  (SELECT pizzeria.id FROM pizzeria
                                  JOIN menu ON (pizzeria.id = menu.pizzeria_id)
                                  WHERE price < 800 AND pizzeria.name != 'Papa Johns' LIMIT 1),
                                  '2022-01-08')
;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats
;
