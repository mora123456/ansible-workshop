FROM sickcodes/docker-osx

USER root

RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && sudo python /tmp/get-pip.py


# starting sshd
RUN passwd -d root


## maybe we want to install docker, postgres etc..