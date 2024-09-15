MATCH (e:Element)-[d:DEPENDS_ON {mode: 'AGG'}]->()
WITH e, sum(d.rel) AS agg_sum
RETURN e.id AS element_id, agg_sum = 1 AS valid