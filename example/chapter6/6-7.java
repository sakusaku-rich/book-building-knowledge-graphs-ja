{
  try (Transaction tx = session.beginTransaction(bookmark)) {
    tx.run("MATCH (user:User {userId: {userId}}) RETURN *",
        parameters("userId", userId));
    tx.success();
  }
}