MATCH (e:Entity {name: $entityname})
MATCH (c:Category)
WHERE e.name IN c.alts
WITH e, collect(c) AS candidate_cats
WITH e, selection_logic(candidate_cats) AS selected_cat
MERGE (e)-[:references]->(selected_cat)