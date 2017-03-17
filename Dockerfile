FROM registry.centos.org/centos/centos

RUN useradd user &&  yum -y install golang git 

ENV GOPATH /tmp/

RUN cd $GOPATH && go get github.com/42wim/matterbridge &&\
    cp $GOPATH/bin/matterbridge /home/user/ && cd /home/user

COPY . /home/user/ 

RUN cd /home/user/ && chmod a+x docker-entry.sh && chmod 777 matterbridge.toml

WORKDIR /home/user

ENTRYPOINT ["./docker-entry.sh"]
