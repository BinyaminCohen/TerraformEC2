#!/bin/bash
yum install -y git
cd /home/ec2-user
su ec2-user -c "git clone https://github.com/BinyaminCohen/FlaskServer.git"
cd ./FlaskServer
yum update -y
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
docker build -t flaskserver .
docker run -p 5000:5000 -d flaskserver