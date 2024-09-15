import org.apache.spark.sql.{SaveMode, SparkSession}

val spark = SparkSession.builder().getOrCreate()
val df = spark.read
  .format("org.neo4j.spark.DataSource")
  .option("url", "bolt://localhost:7687")
  .option("authentication.basic.username", "neo4j")
  .option("authentication.basic.password", "neo4j")
  .option("labels", ":Person")
  .load()
df.where("name = 'John Doe'").where("age = 32").show()