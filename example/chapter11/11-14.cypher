MATCH (e:Element)-[d:DEPENDS_ON {mode: 'AGG'}]->()
WITH e, sum(d.abs) AS agg_sum
RETURN e.id AS element_id, agg_sum = e.total AS valid