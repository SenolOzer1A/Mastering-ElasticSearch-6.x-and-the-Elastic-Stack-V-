mkdir ~/elastic_restaurants
cd ~/elastic_restaurants/
wget http://download.elasticsearch.org/demos/nyc_restaurants/nyc_restaurants-5-4-3.tar.gz .
tar -xf nyc_restaurants-5-4-3.tar.gz
ls -altr ~/elastic_restaurants/nyc_restaurants
echo "add path.repo # example: path.repo: [\"/elasticdata/nyc_restaurants\""
chmod -R 777 /elasticdata/nyc_restaurants  #this is not great, but for an example, it works.
sudo vi /etc/elasticsearch/elasticsearch.yml
sudo service elasticsearch stop
sudo service elasticsearch start
curl -H "Content-Type: application/json" -XPUT 'http://localhost:9200/_snapshot/restaurants_backup' -d '{
    "type": "fs",
    "settings": {
        "location": "/elasticdata/nyc_restaurants",
        "compress": true,
        "max_snapshot_bytes_per_sec": "1000mb",
        "max_restore_bytes_per_sec": "1000mb"
    }
}'

curl -XPOST "localhost:9200/_snapshot/restaurants_backup/snapshot_1/_restore"
curl -H "Content-Type: application/json" -XGET localhost:9200/nyc_restaurants/_count

