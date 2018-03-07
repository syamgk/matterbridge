FROM registry.centos.org/centos/centos:7

RUN yum -y install golang git

ENV GOPATH /tmp/

RUN go get github.com/42wim/matterbridge && cd /tmp/src/github.com/42wim/matterbridge && \
    git checkout tags/v1.8.0 && \
    go build .

RUN mkdir -p /opt/matterbridge && \
    cp /tmp/src/github.com/42wim/matterbridge/matterbridge /opt/matterbridge/

RUN rm -rf /tmp/src /tmp/bin /tmp/pkg && \
    yum clean all

COPY . /opt/matterbridge

RUN  chown -R 1001 /opt/matterbridge && \
     chmod -R 777 /opt/matterbridge && \
     chmod +x /opt/matterbridge/docker-entry.sh

WORKDIR /opt/matterbridge

USER 1001

ENTRYPOINT ["/opt/matterbridge/docker-entry.sh"]
