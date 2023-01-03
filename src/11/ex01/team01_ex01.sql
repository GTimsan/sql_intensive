insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');


CREATE OR REPLACE FUNCTION find_nearest_rate(balance_date TIMESTAMP, currency_id BIGINT)
    RETURNS TABLE (rate_to_usd NUMERIC) AS
$$ BEGIN
    RETURN QUERY
        SELECT currency.rate_to_usd
        FROM currency
        WHERE updated < balance_date AND id=currency_id
        ORDER BY updated DESC
        LIMIT 1;
    IF NOT FOUND THEN
        RETURN QUERY
            SELECT currency.rate_to_usd
            FROM currency
            WHERE updated > balance_date AND id=currency_id
            ORDER BY updated
            LIMIT 1;
    END IF;
    RETURN;
END;
$$
LANGUAGE plpgsql;


WITH agg AS (SELECT user_id,
       currency_id,
       money * find_nearest_rate(updated, currency_id) AS currency_in_usd
FROM balance)

SELECT
       coalesce((SELECT name FROM "user" WHERE id = agg.user_id), 'not defined') AS name,
       coalesce((SELECT lastname FROM "user" WHERE id = agg.user_id), 'not defined') AS lastname,
       (SELECT DISTINCT name FROM currency WHERE id = agg.currency_id) AS currency_name,
       currency_in_usd
FROM agg
ORDER BY name DESC, lastname, currency_name;