curl -XPUT 'localhost:9200/cars?pretty' -H 'Content-Type: application/json' -d @cars.settings
curl -XPUT 'localhost:9200/new_cars?pretty' -H 'Content-Type: application/json' -d @cars.settings

