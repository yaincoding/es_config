#!/usr/bin/bash

export HOST_IP="$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print$2}')"

echo "HOST_IP=${HOST_IP}"

export ES_HOME=$HOME/elasticsearch-7.16.1

echo "ES_HOME=${ES_HOME}"
