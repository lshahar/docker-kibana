#!bin/bash

# KIBANA PWD
sed -ri "s|elasticsearch.password:[^\r\n]*|elasticsearch.password: $KIBANA_PWD|" /etc/kibana/kibana.yml
# ELASTICSEARCH URL
sed -ri "s|elasticsearch.url:[^\r\n]*|elasticsearch.url: $ELASTICSEARCH_PROTOCOL://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT|" /etc/kibana/kibana.yml

# Disable SSL if ELASTICSEARCH_PROTOCOL is http
if [ $ELASTICSEARCH_PROTOCOL = "http" ]; then
  sed -ri "s|elasticsearch.ssl.ca:[^\r\n]*|#elasticsearch.ssl.ca: /etc/elasticsearch/searchguard/ssl/ca/root-ca.pem|" /etc/kibana/kibana.yml
  sed -ri "s|elasticsearch.ssl.verify:[^\r\n]*|#elasticsearch.ssl.verify: true|" /etc/kibana/kibana.yml
fi
