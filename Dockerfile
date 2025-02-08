FROM registry.astralinux.ru/astra/ubi18
COPY prometheus-pushgateway_1.10.0-1+b1_amd64.deb .
RUN apt update;apt install -y ./prometheus-pushgateway_1.10.0-1+b1_amd64.deb
EXPOSE 9091
RUN mkdir -p /pushgateway && chown prometheus:prometheus /pushgateway
WORKDIR /pushgateway

USER prometheus
ENTRYPOINT [ "/usr/bin/prometheus-pushgateway" ]
