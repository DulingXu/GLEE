#!/bin/bash

# 使用 tc qdisc del 命令删除现有队列的延迟时间，并输出到其他节点的时延
sudo docker exec -i glee1 /bin/bash -c "tc qdisc del dev eth0 root;ping 192.168.37.12 -c1;ping 192.168.37.13 -c1"
sudo docker exec -i glee2 /bin/bash -c "tc qdisc del dev eth0 root;ping 192.168.37.13 -c1"
