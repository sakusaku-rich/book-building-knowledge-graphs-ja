MATCH (p:Person) 
WHERE p.source = 'ds1'
SET p.m_yob = toInteger(p.yob);

MATCH (p:Person)
WHERE p.source = 'ds2'
SET p.m_yob = date().year - toInteger(p.age);

MATCH (p:Person) 
WHERE p.source = 'ds3'
SET p.m_yob = date(p.dob).year;