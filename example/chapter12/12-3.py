from neo4j import GraphDatabase
from transformers import pipeline

driver = GraphDatabase.driver("bolt://your.db.ip:7687", auth=("neo4j", "pwd"))
ner_pipe = pipeline("ner", aggregation_strategy="simple")
title = "the title of the article"
fragment = "article fragment"
author = "the author of the article"
url = "https://the.url.of.the.article"

entity_list = []
for entity in ner_pipe(title + fragment):
    entity_list.append(entity)

cypher_query = """\
MERGE (a:Article { url:$url}) ON CREATE SET a.title= $title, a.text= $frg 
MERGE (p:Person { name: $author})
MERGE (a)-[:has_author]->(p)
WITH a UNWIND $entityList AS entity
MERGE (e:Entity { name: entity.word , type: entity.type })
MERGE (a)-[:references { salience: entity.score }]->(e) """

with driver.session(database="neo4j") as session:
    session.write_transaction(
        lambda tx: tx.run(
            cypher_query,
            url=url,
            author=author,
            title=title,
            frg=fragment,
            entityList=[
                {"word": x["word"], "type": x["entity_group"]} for x in entity_list
            ],
        )
    )

driver.close()
