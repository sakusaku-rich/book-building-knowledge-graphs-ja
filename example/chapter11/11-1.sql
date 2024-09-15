SELECT
    count(*) > 0 dependency_exists
FROM
    dependencies d
    INNER JOIN dependencies d1 ON d.depends_on = d1.elem
    INNER JOIN dependencies d2 ON d1.depends_on = d2.elem [...]
WHERE
    d.elem = 'A'
    AND d2.elem = 'F'