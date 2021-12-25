#!/usr/bin/bash

#샤드 할당 비활성화
curl -X PUT http://localhost:9200/_cluster/settings?pretty \
-H 'Content-Type: application/json' \
-u "elatic":"yacopassword"
-d \
'{
  "cluster.routing.allocation.enable": "none"
}'

sleep 5

#primary-replica 동기화
curl -X POST http://localhost:9200/_flush
