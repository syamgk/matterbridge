FROM registry.centos.org/centos/centos

RUN useradd user &&  yum -y install golang git 

ENV GOPATH /tmp/

RUN cd $GOPATH && go get github.com/42wim/matterbridge &&\
    cp $GOPATH/bin/matterbridge /home/user/ && cd /home/user

COPY . /home/user/ 

RUN cd /home/user/ && chmod +x docker-entry.sh

WORKDIR /home/user

ENTRYPOINT ["/home/user/docker-entry.sh"]

