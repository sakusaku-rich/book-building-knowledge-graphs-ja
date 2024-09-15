MATCH (p: Person { name: 'Fred' })
CALL apoc.atomic.concat(p, 'name', 'dy') // Fred が Freddy になる
YIELD oldValue, newValue
RETURN oldValue, newValue
