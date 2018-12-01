curl -XPOST 'localhost:9200/_reindex?pretty' -H 'Content-Type: application/json' -d'{
  "source": {   "index": "cars"            },
  "dest":   {    "index": "new_cars" }
}
'

