CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE (number integer) AS
    $$
        WITH RECURSIVE fibonacci_numbers(val1, val2, step) AS (
            VALUES (0, 1, 1)
                UNION ALL
            SELECT val2, val1 + val2, step + 1 FROM fibonacci_numbers
                                               WHERE val2 <= pstop
        )
--         SELECT array_to_string(array(SELECT val1 || ' ('||step||')' FROM fibonacci_numbers), ', ') || ', ...' as fibonacci_numbers;
        SELECT val1 FROM fibonacci_numbers;
    $$
LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();