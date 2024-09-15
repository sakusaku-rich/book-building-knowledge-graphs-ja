bin/neo4j-admin import \
  --nodes=Person=import/people.csv \
  --relationships=FRIEND=import/friends_header.csv,import/friends1.csv,import/friends2.csv \
  --nodes=Place=import/places_header.csv,import/places1.csv,import/places2.csv \
  --relationships=LIVES_IN=import/people_places.csv