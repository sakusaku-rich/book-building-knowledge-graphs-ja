// ネットワークのトポロジーを作成
// NetworkDevice の追加
MERGE (nsm:NetworkDevice {name: 'Nogent sur Marne', nd_id: 'N08', pos: point({latitude: 2.46995, longitude: 48.834374}), gtype: 1, code: 'nog-1'});
MERGE (ms:NetworkDevice {name: 'Montrouge Sud', nd_id: "N11", pos: point({latitude: 2.316613, longitude: 48.805473}), gtype: 1, code: 'mon-3'});
// ...
// NetworkDevice 間に Link を追加
MATCH (nsm:NetworkDevice {code: 'nog-1'})
MATCH (ms:NetworkDevice {code: 'mon-3'})
MERGE (nsm)-[l:LINK]->(ms)
SET l = {linkId: 's1_385/ol', bundleId: 's1_128/ob', linkType: 'OTN Line', capacity: 1920 }