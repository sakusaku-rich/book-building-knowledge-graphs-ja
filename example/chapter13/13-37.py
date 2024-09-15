from nltk.corpus import wordnet as wn

dog = wn.synset("dog.n.01")
lion = wn.synset("lion.n.01")
print(dog.definition())
print(lion.definition())
print(wn.wup_similarity(dog, lion))
