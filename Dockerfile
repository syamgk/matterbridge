FROM registry.centos.org/centos/centos

RUN useradd user &&  yum -y install golang git

ENV GOPATH /tmp/

RUN cd /home/user &&\
    git clone https://github.com/syamgk/matterbridge &&\
    cd matterbridge &&\
    chmod +x docker-entry.sh

RUN go get github.com/42wim/matterbridge &&\
    cp /tmp/bin/matterbridge /home/user/matterbridge

WORKDIR /home/user/matterbridge

ENTRYPOINT ["/home/user/matterbridge/docker-entry.sh"]

