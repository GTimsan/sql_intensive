WITH RECURSIVE a_traces AS (SELECT node1 AS tour, node1, node2, cost, cost AS summ
                                    FROM nodes
                                    WHERE node1 = 'a'
    UNION ALL
    SELECT parrent.tour || ',' || child.node1 AS trace,
           child.node1,
           child.node2,
           child.cost,
           parrent.summ + child.cost AS summ
    FROM nodes AS child
    INNER JOIN a_traces AS parrent ON (child.node1 = parrent.node2)
    WHERE tour NOT LIKE '%' || child.node1 || '%'

    ), tmp AS(SELECT summ AS total_cost, '{'||tour||','||node2||'}' AS tour
    FROM a_traces
    WHERE length(tour) = 7 AND node2 = 'a')

SELECT * FROM  tmp WHERE total_cost IN ((SELECT min(total_cost) FROM tmp), (SELECT max(total_cost) FROM tmp))
ORDER BY 1, 2
;