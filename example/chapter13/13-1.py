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

for ent in res.json()["entities"]:
    print(ent)
# グラフへの書き込み

for fact in res.json()["facts"]:
    print(fact)
# グラフへの書き込み
