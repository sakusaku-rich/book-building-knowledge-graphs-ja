import org.apache.spark.sql.{SaveMode, SparkSession}
import scala.util.Random

val spark = SparkSession.builder().getOrCreate()

import spark.implicits._

case class Person(name: String, surname: String, age: Int)
val ds = (
  // データソースを指定
).toDS()
ds.write
  .format("org.neo4j.spark.DataSource")
  .mode(SaveMode.ErrorIfExists)
  .option("url", "bolt://localhost:7687")
  .option("labels", ":Person")
  .save()