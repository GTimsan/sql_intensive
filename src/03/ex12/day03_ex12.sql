INSERT INTO person_order VALUES (
                                generate_series(
                                 (SELECT max(id) FROM person_order) +1,
                                 (SELECT max(id) FROM person_order)+(SELECT max(id) FROM person),1
                                    ),
                                 generate_series(1,(SELECT max(id) FROM person),1),
                                 (SELECT id FROM menu WHERE pizza_name='greek pizza' LIMIT 1),
                                 '2022-02-25'
                                 );