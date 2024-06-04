#!/bin/bash

# 定义目标 IP 地址
target_ip="192.168.37.13"

# 定义日志文件路径
log_file="ping_13.log"

# 使用 sudo docker exec 进入 glee1 容器，并执行 ping 命令
sudo docker exec -i glee1 /bin/bash -c "while true; do ping -c 1 -q $target_ip | grep -Eo 'time=[0-9.]+' | cut -d '=' -f2 >> $log_file; sleep 1; done"
