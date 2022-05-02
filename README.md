# ansible-workshop


## Prerequisite:
[Install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

[Install docker](https://docs.docker.com/get-docker/)


```
git clone https://github.com/mora123456/ansible-workshop.git && \
cd ansible-workshop && \
chmod 0600 ansible_compose/server_keys/ssh_host_* && \
docker-compose -f ansible_compose/docker-compose.yml build --force-rm
```

Open project in pycharm


## Run containers:

1. Start both containers: `docker-compose -f ansible_compose/docker-compose.yml up -d`

2. Make sure we have 2 running containers: `docker ps -a`

3. Open ansible_client shell: `docker exec -it ansible_client bash`

4. In a second terminal tab (shift + ctrl + d) open ansible_server shell: `docker exec -it some_server bash`


## Tear down:

```
docker-compose -f ansible_compose/docker-compose.yml stop && \
docker rm  $(docker ps -a -q) && \
docker rmi ansible_client:latest some_server:latest
cd .. && \
rm -r ansible-workshop
```

