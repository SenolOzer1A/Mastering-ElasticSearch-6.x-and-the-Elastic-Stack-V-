
curl -XPOST 'http://localhost:9200/_bulk?pretty' -H 'Content-Type: application/json' -d'
{ "index" : { "_index" : "carsforsale", "_type" : "car" } }
{ "user" : "fauie", "post_date" : "2009-11-15T14:12:12", "make" : "Nissan", "model" : "Sentra" }
{ "index" : { "_index" : "carsforsale", "_type" : "car" } }
{ "user" : "fauie", "post_date" : "2009-11-15T14:12:12", "make" : "Jeep", "model" : "Wrangler" }
{ "index" : { "_index" : "carsforsale", "_type" : "car" } }
{ "user" : "fauie", "post_date" : "2009-11-15T14:12:12", "make" : "Hyundai", "model" : "Santa Fe Sport" }
'

