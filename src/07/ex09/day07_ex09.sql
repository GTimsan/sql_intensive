SELECT *, formula > average AS comparison
    FROM (SELECT address,
       round(CAST(max(age::float) - (min(age::float) / max(age::float)) AS numeric), 2) AS formula,
       round(avg(age), 2) AS average
FROM person
GROUP BY address
ORDER BY 1) AS tmp