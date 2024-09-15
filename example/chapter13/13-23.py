from rasa_sdk.knowledge_base.actions import ActionQueryKnowledgeBase
from rasa_sdk.knowledge_base.storage import KnowledgeBase


class MyKnowledgeBaseAction(ActionQueryKnowledgeBase):
    def init(self):
        knowledge_base = KnowledgeBase("Neo4j への参照")
        super().init(knowledge_base)
