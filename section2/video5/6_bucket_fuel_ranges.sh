curl -XGET 'localhost:9200/cars/_search?pretty' -H 'Content-Type: application/json' -d'
{   "size": 0,
    "aggs" : {
    "price_ranges" : {
    "range" : {
     "field" : "city08",
     "ranges" : [
         { "to" : 10.0 },
         { "from" : 10.0, "to" : 20.0 },
         { "from" : 20.0 }
     ]
   }
 }
}
                                                                                                                                                                    }
                                                                                                                                                                    '

