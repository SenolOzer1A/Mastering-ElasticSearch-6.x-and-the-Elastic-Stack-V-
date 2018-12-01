curl -XGET 'localhost:9200/cars/_search?pretty' -H 'Content-Type: application/json' -d'
{
        "query" : { "term" : { "make" : "ford" } }
}
'

