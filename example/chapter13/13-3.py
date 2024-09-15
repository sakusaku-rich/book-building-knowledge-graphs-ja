# 不完全なコード
import requests

HOST = "nl.diffbot.com"
TOKEN = "<YOUR_TOKEN>"
payload = {
    "content": "Pichette is a partner at Inovia Capital and chair of commerce platform Lightspeed",
    "lang": "en",
}
res = requests.post(
    "https://{}/v1/?fields={}&token={}".format(HOST, "entities,facts", TOKEN),
    json=payload,
)

entity_list = res.json()["entities"]
fact_list = res.json()["facts"]
# entity と fact をパラメータとして書き込みトランザクションを Cypher で行う
cypher = """\
UNWIND $facts AS fact
MERGE (source:Entity {id: fact.entity.diffbotUri})
MERGE (target:Entity {id: fact.value.diffbotUri})
WITH source, target, fact
CALL apoc.create.relationship(source, fact.property.name, {}, target) # サリエンスなどを追加"""
