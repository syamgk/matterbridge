FROM registry.centos.org/centos/centos

RUN useradd matterbridge &&  yum -y install golang git

ENV GOPATH /tmp/

RUN go get github.com/42wim/matterbridge &&\
    cp /tmp/bin/matterbridge /home/matterbridge

RUN cd /home/matterbridge &&\
    git clone https://github.com/syamgk/matterbridge . &&\
    chmod +x docker-entry.sh

ENTRYPOINT ["docker-entry.sh"]

