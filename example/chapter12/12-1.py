from transformers import pipeline

ner_pipe = pipeline("ner", aggregation_strategy="simple")
title = """Twitter chair Patrick Pichette joins graph data\
 platform Neo4j board of directors."""

for entity in ner_pipe(title):
    print(entity)
