CREATE TABLE IF NOT EXISTS nodes
 (node1 VARCHAR NOT NULL,
  node2 VARCHAR NOT NULL,
  cost INTEGER NOT NULL
  );


INSERT INTO nodes VALUES ('a', 'b', 10), ('b', 'a', 10), ('a', 'd', 20),
                         ('d', 'a', 20), ('a', 'c', 15), ('c', 'a', 15),
                         ('b', 'c', 35), ('c', 'b', 35), ('d', 'b', 25),
                         ('b', 'd', 25), ('d', 'c', 30), ('c', 'd', 30);

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

    )
SELECT summ AS total_cost, '{'||tour||','||node2||'}' AS tour
FROM a_traces
WHERE length(tour) = 7 AND node2 = 'a' AND summ = (SELECT min(summ) FROM a_traces WHERE length(tour) = 7)
ORDER BY 1, 2
;