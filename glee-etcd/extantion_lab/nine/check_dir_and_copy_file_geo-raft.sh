#!/bin/bash

# 检查并在glee1中创建/expr目录和/expr/data目录
docker exec -it glee1 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee1 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee2中创建/expr目录和/expr/data目录
docker exec -it glee2 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee2 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee3中创建/expr目录和/expr/data目录
docker exec -it glee3 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee3 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee4中创建/expr目录和/expr/data目录
docker exec -it glee4 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee4 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee5中创建/expr目录和/expr/data目录
docker exec -it glee5 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee5 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee6中创建/expr目录和/expr/data目录
docker exec -it glee6 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee6 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee7中创建/expr目录和/expr/data目录
docker exec -it glee7 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee7 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee8中创建/expr目录和/expr/data目录
docker exec -it glee8 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee8 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 检查并在glee9中创建/expr目录和/expr/data目录
docker exec -it glee9 bash -c "if [ ! -d '/expr' ]; then mkdir /expr; fi"
docker exec -it glee9 bash -c "if [ ! -d '/expr/data' ]; then mkdir /expr/data; fi"

# 定义要复制的文件路径
SOURCE_FILE="../../bin/geo-raft"

# 定义目标容器
CONTAINERS=("glee1" "glee2" "glee3" "glee4" "glee5" "glee6" "glee7" "glee8" "glee9")

# 遍历每个容器,执行复制
for container in ${CONTAINERS[@]}  
do
  docker cp $SOURCE_FILE $container:/expr/
done


docker exec -it glee1 chmod +x /expr/geo-raft
docker exec -it glee2 chmod +x /expr/geo-raft
docker exec -it glee3 chmod +x /expr/geo-raft
docker exec -it glee4 chmod +x /expr/geo-raft
docker exec -it glee5 chmod +x /expr/geo-raft
docker exec -it glee6 chmod +x /expr/geo-raft
docker exec -it glee7 chmod +x /expr/geo-raft
docker exec -it glee8 chmod +x /expr/geo-raft
docker exec -it glee9 chmod +x /expr/geo-raft
