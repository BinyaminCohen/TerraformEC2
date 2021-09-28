#!/bin/bash
cd /home/ubuntu
su ubuntu -c "git clone https://github.com/BinyaminCohen/FlaskServer.git"
cd ./FlaskServer
apt install -y docker.io
docker build -t flaskserver .
docker run -p 5000:5000 -d flaskserver