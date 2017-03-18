FROM registry.centos.org/centos/centos

RUN yum -y install golang git && \
    mkdir /opt/matterbridge

ENV GOPATH /opt/matterbridge

RUN cd $GOPATH && go get github.com/42wim/matterbridge && \
    cp $GOPATH/bin/matterbridge /opt/matterbridge 

COPY . /opt/matterbridge

RUN  chown -R 1001 /opt/matterbridge && \
     chmod -R 777 /opt/matterbridge &&\
     chmod +x /opt/matterbridge/docker-entry.sh

WORKDIR /opt/matterbridge

USER 1001

ENTRYPOINT ["/opt/matterbridge/docker-entry.sh"]
