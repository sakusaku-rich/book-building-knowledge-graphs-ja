MATCH (p1:Person)-[sim:SIMILAR]->(p2:Person)
WITH sim, abs(p1.m_yob - p2.m_yob) AS yob_diff
SET sim.sim_score = sim.sim_score * CASE WHEN yob_diff > $yob_threshold THEN .9 ELSE 1.1 END