import org.apache.spark.sql.{SaveMode, SparkSession}

val spark = SparkSession.builder().getOrCreate()
spark.read
  .format("org.neo4j.spark.DataSource")
  .option("url", "bolt://localhost:7687")
  .option(
    "query",
    "MATCH (n:Person)-[FOLLOWS]->(:Person name: 'emileifrem') "
      + "WITH n "
      + "LIMIT 20 "
      + "RETURN id(n) AS id, n.name AS name"
  )
  .load()
  .show()