CALL n10s.graphconfig.init({handleVocabUris: 'IGNORE', classLabel: 'Concept', subClassOfRel: 'broader'})
CALL n10s.skos.import.fetch('path-to-file-containing-organizing-principle', 'RDF/XML')