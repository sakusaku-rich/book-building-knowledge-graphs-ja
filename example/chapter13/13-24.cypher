CREATE CONSTRAINT n10s_unique_uri ON (r:Resource)
ASSERT r.uri IS UNIQUE;

CALL n10s.graphconfig.init({handleVocabUris: 'IGNORE'});
CALL n10s.rdf.import.fetch('.../english-wordnet-2021.ttl.gz', 'Turtle');