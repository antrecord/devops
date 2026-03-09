#!/bin/bash -x

docker stop nginx-cont
docker rm nginx-cont

docker build -t nginx-server /home/user/devops2026/docker

docker run -d --name nginx-cont -p 54321:80 --restart unless-stopped nginx-server

docker ps -a
sleep 5
curl 127.0.0.1:54321
docker logs -n 10 nginx-cont
