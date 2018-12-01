curl -XPOST -u elastic 'localhost:9200/_xpack/security/role/nyc_admin' -H "Content-Type: application/json" -d '{
  "indices" : [
    {
      "names" : [ "nyc*" ],
      "privileges" : [ "all" ]
    },
    {
      "names" : [ ".kibana*" ],
      "privileges" : [ "manage", "read", "index" ]
    }
  ]
}'

curl -XPOST -u elastic 'localhost:9200/_xpack/security/user/chris' -H "Content-Type: application/json" -d '{
  "password" : "userpassword",
  "full_name" : "Chris Fauerbach",
  "email" : "chris@fauie.com",
  "roles" : [ "nyc_admin" ]
}'

