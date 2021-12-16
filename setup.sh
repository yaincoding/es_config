#!/usr/bin/bash

export HOST_IP="$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print$2}')"

echo "HOST_IP=${HOST_IP}"

