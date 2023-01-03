CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
    (pperson varchar DEFAULT 'Dmitriy'
    , pprice numeric DEFAULT 500
    , pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria varchar) AS
    $$ BEGIN
    RETURN QUERY
        SELECT pizzeria.name
        FROM pizzeria
        JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
        JOIN person p on pv.person_id = p.id
        JOIN person_order po on p.id = po.person_id AND visit_date = order_date
        JOIN menu m on m.id = po.menu_id
        WHERE p.name = pperson AND m.price < pprice AND order_date = pdate;
    END ;
    $$
LANGUAGE plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);
select * from fnc_person_visits_and_eats_on_date
    (pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');