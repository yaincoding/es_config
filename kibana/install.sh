#!/usr/bin/bash

#super user로 실행

echo [kibana-7.x] >> /etc/yum.repos.d/kibana.repo
echo name=Kibana repository for 7.x packages >> /etc/yum.repos.d/kibana.repo
echo baseurl=https://artifacts.elastic.co/packages/7.x/yum >> /etc/yum.repos.d/kibana.repo
echo gpgcheck=1 >> /etc/yum.repos.d/kibana.repo
echo jgpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch >> /etc/yum.repos.d/kibana.repo
echo enabled=1 >> /etc/yum.repos.d/kibana.repo
echo autorefresh=1 >> /etc/yum.repos.d/kibana.repo
echo type=rpm-md >> /etc/yum.repos.d/kibana.repo

yum install -y kibana-7.16.1

