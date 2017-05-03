FROM java:7

ENV JMX_REMOTE_HOST localhost
ENV JMX_REMOTE_PORT 5555

RUN apt-get update -y && \ 
    apt-get install dnsutils netcat telnet -y && \
    mkdir -p /opt/jmx_exporter && \
    curl -k https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/0.9/jmx_prometheus_httpserver-0.9-jar-with-dependencies.jar -o /opt/jmx_exporter/jmx_prometheus_httpserver-0.9.jar

ADD docker-entrypoint.sh /opt/jmx_exporter/docker-entrypoint.sh
ADD httpserver_config.yml /opt/jmx_exporter/httpserver_config.yml
RUN chmod +x /opt/jmx_exporter/docker-entrypoint.sh
EXPOSE 5556
ENTRYPOINT ["/opt/jmx_exporter/docker-entrypoint.sh"]
