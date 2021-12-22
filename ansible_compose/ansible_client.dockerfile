FROM sickcodes/docker-osx

RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && sudo python /tmp/get-pip.py && sudo python -m pip install ansible
ENV PATH="/home/arch/.local/bin/:$PATH"
USER root
RUN ssh-keygen -q -N '' -f /root/.ssh/id_rsa
#RUN sudo mkdir /etc/ansible && sudo ansible-config init --disabled -t all > /etc/ansible/ansible.cfg


