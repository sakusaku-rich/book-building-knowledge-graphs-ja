MATCH (n) // ノードを削除、ただしリレーションが半端に残ってしまう場合は削除を中断
DELETE n

MATCH ()-[r:LIVES_IN]->()
DELETE r // 任意のノード間の :LIVES_IN リレーションを削除

MATCH (n)
DETACH DELETE n // 全てのノードと接続しているリレーションを削除。グラフ全体を効率的に削除可能
