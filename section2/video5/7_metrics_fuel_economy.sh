curl -XGET 'localhost:9200/cars/_search?pretty' -H 'Content-Type: application/json' -d'
{   "size": 0,
    "aggs" : {
    "avg_fuel_economy" : {
    "avg" : {
     "field" : "city08"
   }
 }
}
                                                                                                                                                                    }
                                                                                                                                                                    '

