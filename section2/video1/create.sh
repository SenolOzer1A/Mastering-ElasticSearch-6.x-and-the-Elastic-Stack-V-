curl -XPUT 'localhost:9200/carsforsale/car/1?pretty' -H 'Content-Type: application/json' -d'
{
    "user" : "fauie", "post_date" : "2009-11-15T14:12:12", "make" : "Ford", "model" : "Flex"
}
'

