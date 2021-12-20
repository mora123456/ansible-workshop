FROM sickcodes/docker-osx

USER root

# starting sshd
RUN passwd -d root && \
    sed -i 's/#PermitEmptyPasswords/PermitEmptyPasswords/' /etc/ssh/sshd_config && \
    sed -i '/^PermitEmptyPasswords/s/no/yes/' /etc/ssh/sshd_config && \
    cd ~/.ssh && ssh-keygen -A

# /etc/ssh/sshd_config
## maybe we want to install docker, postgres etc..