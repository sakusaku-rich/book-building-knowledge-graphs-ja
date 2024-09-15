:params {declared: { I: 0.5, K: 1, J: 0.33 }, current: "G"};

MATCH (e:Element {id: $current})-[d:DEPENDS_ON {mode: 'AGG'}]->()
WITH e.id AS element, coalesce($declared[endNode(d).id], 0) * d.abs AS partial_impact
RETURN element, sum(partial_impact) AS derived_impact