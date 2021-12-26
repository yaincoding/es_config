#!/usr/bin/bash

#CA 생성
/usr/share/elasticsearch/bin/elasticsearch-certutil ca --out /etc/elasticsearch/elastic-stack-ca.p12 --pass "yacopass"

#certificates 생성
/usr/share/elasticsearch/bin/elasticsearch-certutil cert \
--ca "/etc/elasticsearch/elastic-stack-ca.p12" \
--ca-pass "yacopass" \
--out "/etc/elasticsearch/elastic-certificates.p12" \
--pass "yacopass"

#elasticsearch node 접근 가능하도록 권한 elasticsearch 계정으로 변경
chown -R elasticsearch:elasticsearch /etc/elasticsearch/elastic-stack-ca.p12
chown -R elasticsearch:elasticsearch /etc/elasticsearch/elastic-certificates.p12

#certificates 패스워드 elasticsearch keystore에 저장
printf "yacopass" | /usr/share/elasticsearch/bin/elasticsearch-keystore add xpack.security.transport.ssl.keystore.secure_password
printf "yacopass" | /usr/share/elasticsearch/bin/elasticsearch-keystore add xpack.security.transport.ssl.truststore.secure_password
