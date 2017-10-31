FROM registry.centos.org/centos/centos:7

RUN yum -y install wget && \
    yum clean all

RUN mkdir -p /opt/matterbridge && \
    cd /opt/matterbridge && \
    wget -O matterbridge https://github.com/42wim/matterbridge/releases/download/v1.3.1/matterbridge-linux-amd64

COPY . /opt/matterbridge

RUN  chown -R 1001 /opt/matterbridge && \
     chmod -R 777 /opt/matterbridge && \
     chmod +x /opt/matterbridge/docker-entry.sh

WORKDIR /opt/matterbridge

USER 1001

ENTRYPOINT ["/opt/matterbridge/docker-entry.sh"]
