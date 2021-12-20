#!/usr/bin/bash

### 엘라스틱서치 구동환경 세팅 파일입니다.
### 이 스크립트는 sudo 권한으로 실행해야 합니다.

### parameter1 ###
## i. bootstrap -> bootstrap 모드로 클러스터 실행
## ii. discovery -> cluster bootstrap 없이 yaco_cluster 찾아서 합류

###실행 명령 예시###
###ex1) sudo ./install.sh bootstrap###
###ex2) sudo ./install.sh discovery###

MODE=$1

if [ "$MODE" != "bootstrap" ] && [ "$MODE" != "discovery" ]
then
  echo "The only argument must be 'bootstrap' or 'discovery'"
fi

#timezone 변경
cp -p /usr/share/zoneinfo/Asia/Seoul /etc/localtime

yum install -y java-1.8.0-openjdk-devel.x86_64

echo [elasticsearch-7.x] >> /etc/yum.repos.d/elasticsearch.repo
echo name=Elasticsearch repository for 7.x packages >> /etc/yum.repos.d/elasticsearch.repo
echo baseurl=https://artifacts.elastic.co/packages/7.x/yum >> /etc/yum.repos.d/elasticsearch.repo
echo gpgcheck=1 >> /etc/yum.repos.d/elasticsearch.repo
echo gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch >> /etc/yum.repos.d/elasticsearch.repo
echo enabled=1 >> /etc/yum.repos.d/elasticsearch.repo
echo autorefresh=1 >> /etc/yum.repos.d/elasticsearch.repo
echo type=rpm-md >> /etc/yum.repos.d/elasticsearch.repo

yum install -y elasticsearch-7.16.1

/usr/share/elasticsearch/bin/elasticsearch-plugin install --batch discovery-ec2

rm /etc/elasticsearch/jvm.options
cp ./jvm.options /etc/elasticsearch

rm /etc/elasticsearch/elasticsearch.yml
cp ./$1/elasticsearch.yml /etc/elasticsearch

