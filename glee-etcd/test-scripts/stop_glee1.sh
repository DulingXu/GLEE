#!/bin/bash
# set -euo pipefail

# 停止容器中的 glee-etcd 进程
docker exec glee1 pkill glee-etcd

# 解除端口绑定
# 检查 2380 端口
PID=$(docker exec glee1 lsof -ti :2380)
if [ ! -z "$PID" ]; then
  docker exec glee1 kill $PID
fi

# 检查 2379 端口
PID=$(docker exec glee1 lsof -ti :2379)
if [ ! -z "$PID" ]; then  
  docker exec glee1 kill $PID
fi

# 清空 etcd 数据目录
docker exec glee1 rm -rf /expr/data/
