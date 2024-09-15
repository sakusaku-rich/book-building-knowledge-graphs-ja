MATCH (p:Person)
WHERE p.source = 'ds1'
SET p.m_fullname = toLower(trim(p.full_name));

MATCH (p:Person)
WHERE p.source = 'ds2'
WITH p, split(p.name, ',') AS parts
SET p.m_fullname = toLower(trim(parts[1]) + ' ' + trim(parts[0]));

MATCH (p:Person)
WHERE p.source = 'ds3'
SET p.m_fullname = toLower(trim(p.first_name) + ' ' + trim(p.last_name));