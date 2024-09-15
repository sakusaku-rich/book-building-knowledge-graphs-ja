from google.cloud import language_v1

client = language_v1.LanguageServiceClient.from_service_account_json("services.json")

text = (
    "Twitter chair Patrick Pichette joins graph data platform Neo4j board of directors"
)
document = language_v1.Document(
    content=text, type_=language_v1.Document.Type.PLAIN_TEXT
)

response = client.analyze_entities(request={"document": document})

for entity in response.entities:
    print(entity)
