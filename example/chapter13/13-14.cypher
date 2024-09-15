MATCH (n:Entity)
UNWIND keys(n) AS property
RETURN n.name + "'s " + replace(property, '_', ' ') + ' is ' + n[property] AS sentence