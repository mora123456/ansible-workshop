# ansible-workshop


## Prerequisite:
Install docker

Run entire block:

```
git clone https://github.com/mora123456/ansible-workshop.git && \
cd ansible-workshop && \
chmod 0600 ansible_compose/server_keys/ssh_host_* && \
docker-compose -f ansible_compose/docker-compose.yml build --force-rm
```

Open project in pycharm


## Start containers:
Run each line separately:

```
docker-compose -f ansible_compose/docker-compose.yml up -d
docker ps -a  # make sure we have 2 running containers
docker exec -it ansible_client bash
# open a second terminal tab (shift + ctrl + d)
docker exec -it some_server bash
```

## Tear down:
Run entire block:

```
docker-compose -f ansible_compose/docker-compose.yml stop && \
docker rm  $(docker ps -a -q) && \
docker rmi ansible_client:latest some_server:latest
cd .. && \
rm -r ansible-workshop
```

