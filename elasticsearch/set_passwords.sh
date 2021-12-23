#!/usr/bin/bash

curl -X GET -H 'Content-Type: application/json' http://localhost:9200/_security/user/kibana_system/_password -d '{"password": "kibanapassword"}'

