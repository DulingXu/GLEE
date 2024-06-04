#!/bin/bash

# 执行 run_etcd.sh 脚本
#sudo ./run_glee_etcd.sh
#sudo 3_1.sh

sleep 10

# 打印集群状态并记录到 test.log 文件中
sudo ETCDCTL_API=3 ../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379 endpoint status -w table --command-timeout=1s >> test.log

# 模拟 glee1 宕机
sudo ./stop_glee1.sh

sleep 5

# 再次打印集群状态并追加记录到 test.log 文件中
sudo ETCDCTL_API=3 ../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379 endpoint status -w table --command-timeout=1s >> test.log

# 关闭整个集群
sudo ./stop_and_clean_glee-etcd.sh
#sudo ./stop_and_clean_etcd.sh

#sleep 10

# 启动集群 
#./run_glee_etcd.sh

# 等待 20 秒，确保 glee1 容器已经完全启动并加入集群
# sleep 10

# 再次打印集群状态并追加记录到 test.log 文件中
# ETCDCTL_API=3 ../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379 endpoint status -w table --command-timeout=1s >> test.log

# 执行 stop_and_clean_etcd.sh 脚本
# ./stop_and_clean_etcd.sh

