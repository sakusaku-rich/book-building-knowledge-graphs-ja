MATCH (:Skill {name: 'Java'})<-[:REQUIRES]-(:Project)<-[:PARTICIPATED]-(e:Employee)
CALL {
  WITH e
  MATCH (e)-[:PARTICIPATED]->(p:Project)
  RETURN collect(duration.inMonths(p.start, p.end).months) AS duration
}
RETURN DISTINCT e.name,
	reduce(total=0, number in duration | total + number) AS monthsOfExperience