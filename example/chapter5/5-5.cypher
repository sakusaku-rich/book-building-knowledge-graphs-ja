CALL apoc.load.driver('com.mysql.jdbc.Driver');
WITH 'select firstname, lastname from employees where firstname like ? and lastname like ?' AS sql 
CALL apoc.load.jdbcParams('northwind', sql, ['F%', '%w']) YIELD row
MATCH (row)-[:WORKS_FOR*1..3]->(boss:Person)
RETURN (boss)