curl -XPUT 'localhost:9100/2019-11-01-apachelogs?pretty' -H 'Content-Type: application/json' -d'
{ "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 1 } } }
'

curl -XPUT 'localhost:9200/2019-11-02-apachelogs?pretty' -H 'Content-Type: application/json' -d'
{ "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 1 } } }
'

curl -XPUT 'localhost:9200/2019-11-03-apachelogs?pretty' -H 'Content-Type: application/json' -d'
{ "settings" : { "index" : { "number_of_shards" : 1, "number_of_replicas" : 1 } } }
'

