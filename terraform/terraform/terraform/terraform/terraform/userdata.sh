#!/bin/bash


apt update


apt install -y docker.io


systemctl start docker


systemctl enable docker


docker pull treybow/taskmanager:latest


docker run -d \
-p 80:5000 \
--name taskmanager \
treybow/taskmanager:latest