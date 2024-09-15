// キーワードベース
CREATE (c:Category {name: 'Person', alts: ['Human', 'Pax', 'Pers']});

// 正規表現ベース（含む、除くのリスト）
CREATE (c:Category {name: 'COVID-19', inc: ['covid.*', 'corona.*'], excl: ['sars.*']});