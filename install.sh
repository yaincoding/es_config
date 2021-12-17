#!/usr/bin/bash

sudo yum install -y java-1.8.0-openjdk-devel.x86_64

echo [elasticsearch-7.x] >> /etc/yum.repos.d/elasticsearch.repo
echo name=Elasticsearch repository for 7.x packages >> /etc/yum.repos.d/elasticsearch.repo
echo baseurl=https://artifacts.elastic.co/packages/7.x/yum >> /etc/yum.repos.d/elasticsearch.repo
echo gpgcheck=1 >> /etc/yum.repos.d/elasticsearch.repo
echo gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch >> /etc/yum.repos.d/elasticsearch.repo
echo enabled=0 >> /etc/yum.repos.d/elasticsearch.repo
echo autorefresh=1 >> /etc/yum.repos.d/elasticsearch.repo
echo type=rpm-md >> /etc/yum.repos.d/elasticsearch.repo

sudo yum install -y elasticsearch-7.16.1
sudo /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch discovery-ec2
