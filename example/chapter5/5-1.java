import static org.neo4j.driver.Values.parameters;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
public class JavaDriverExample implements AutoCloseable {
  // ドライバインスタンスの生成は高コスト
  // 通常、アプリケーションのライフタイムを通してただ 1
  // つのドライバを生成すれば十分
  private final Driver driver;
  public JavaDriverExample(String uri, String user, String password) {
    // 1. ドライバオブジェクトは高コスト
    driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
  }
  @Override
  public void close() {
    driver.close();
  }
  public Result findFriends(final String name) {
    // 2. セッションの生成は低コスト。必要なタイミングで使用する。
    try (Session session = driver.session()) {
      // 3. クエリがグラフを更新するか否かをドライバに示し、
      //    クラスタ内で適切なルーティングが行えるようにする
      // Session#writeTransaction も利用可能
      return session.readTransaction(tx - > {
        Result result = tx.run("MATCH (a:Person)-[:FRIEND]->(b:Person) "
                + "WHERE a.name = $name " + // 4. パラメータ化
                "RETURN b.name",
            parameters("name", name));
        return result;
      });
    }
  }
  public static void main(String... args) throws Exception {
    try (JavaDriverExample example = new JavaDriverExample(
             "bolt://localhost:7687", "neo4j", "password")) {
      example.findFriends("Rosa");
    }
  }
}