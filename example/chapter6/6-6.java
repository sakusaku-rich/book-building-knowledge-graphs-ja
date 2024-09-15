try (Session session = driver.session(AccessMode.WRITE)) {
  try (Transaction tx = session.beginTransaction()) {
    tx.run("CREATE (user:User {userId: {userId}, passwordHash: {passwordHash})",
        parameters("userId", userId, "passwordHash", passwordHash));
    tx.success();
  }
  // ブックマークは直前にコミットしたトランザクションの ID
  String bookmark = session.lastBookmark();
}