import org.apache.spark.sql.{SaveMode, SparkSession}

val spark = SparkSession.builder().getOrCreate()
// Sprak のデータフレームを指定
val df = ...
// 知識グラフに内容を保存
df.write
  .format("org.neo4j.spark.DataSource")
  .option("url", "bolt://second.host.com:7687")
  .option("relationship", "FOLLOWS")
  .option("relationship.source.labels", ":Person")
  .option("relationship.source.save.mode", "Overwrite")
  .option("relationship.source.node.keys", "source.name:name")
  .option("relationship.target.labels", ":Person")
  .option("relationship.target.save.mode", "Overwrite")
  .option("relationship.target.node.keys", "target.name:name")
  .save()