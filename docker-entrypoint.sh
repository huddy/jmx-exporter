#!/usr/bin/env bash
# Script to run a java application for testing jmx4prometheus.

sed -i s/#JMX_REMOTE_HOST#/${JMX_REMOTE_HOST}/g /opt/jmx_exporter/httpserver_config.yml
sed -i s/#JMX_REMOTE_PORT#/${JMX_REMOTE_PORT}/g /opt/jmx_exporter/httpserver_config.yml
if [[ -z "${JMX_REMOTE_USERNAME}" ]]; then
  echo "didnt find username"
  sed -i s/#JMX_REMOTE_USERNAME#//g /opt/jmx_exporter/httpserver_config.yml
  sed -i s/#JMX_REMOTE_PASSWORD#//g /opt/jmx_exporter/httpserver_config.yml
else
  echo "found username"
  sed -i s/#JMX_REMOTE_USERNAME#/${JMX_REMOTE_USERNAME}/g /opt/jmx_exporter/httpserver_config.yml
  sed -i s/#JMX_REMOTE_PASSWORD#/${JMX_REMOTE_PASSWORD}/g /opt/jmx_exporter/httpserver_config.yml

fi
# Note: You can use localhost:5556 instead of 5556 for configuring socket hostname.
java -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=5555 -jar /opt/jmx_exporter/jmx_prometheus_httpserver-0.9.jar 5556 /opt/jmx_exporter/httpserver_config.yml

