COMMENT ON TABLE person_discounts IS
    'Таблица личных скидок клиентов в пиццериях';
COMMENT ON COLUMN person_discounts.id
   IS 'Идентификатор';
COMMENT ON COLUMN person_discounts.person_id
   IS 'Внешний ключ для таблицы покупателей';
COMMENT ON COLUMN person_discounts.pizzeria_id
   IS 'Внешний ключ для таблицы пиццерий';
COMMENT ON COLUMN person_discounts.discount
   IS 'Личная скидка в процентах';