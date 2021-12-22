FROM sickcodes/docker-osx

USER root

RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && sudo python /tmp/get-pip.py


# removing paa for root
RUN passwd -d root

# installing redis aerver
RUN mkdir redis && cd redis && \
    curl -O http://download.redis.io/redis-stable.tar.gz && \
    tar xzvf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
#    make test && \
    make install

## maybe we want to install docker, postgres etc..