MATCH (e:Element)
OPTIONAL MATCH ()<-[dependee:DEPENDS_ON {mode: 'AGG'}]-(e)
WITH e, sum(dependee.abs) AS agg_sum
OPTIONAL MATCH ()<-[dependee:DEPENDS_ON {mode: 'RED'}]-(e)
WITH e, agg_sum, coalesce(min(dependee.abs), 0) AS red_sum
WITH e, agg_sum, red_sum, agg_sum + red_sum AS total_cap
WHERE total_cap > 0
MATCH (e)<-[dependent:DEPENDS_ON]-()
WITH e.id AS elem, agg_sum, red_sum, total_cap, sum(dependent.abs) AS used
RETURN elem, agg_sum, red_sum, total_cap, used, used * 100.0 / total_cap AS percentage_used