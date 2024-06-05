# F1. 前期准备
Docker and Go
Docker 工具用于仿真多个节点，需要在服务器上先安装上。Go 是语言环境。
1.1  安装 Docker 
按照网上的方法在 ubuntu 上安装 docker，可以是 GO Version: 26.0.0 。
1.2 创建 Docker 节点
## 创建网络
sudo docker network create --driver=bridge --subnet=192.168.37.0/24 glee-net

## 创建 k 个不同的docker容器
sudo docker run -dit --name=glee1 --hostname='glee1' --network=glee-net --ip=192.168.37.11 --privileged ubuntu:22.04 /bin/bash
sudo docker run -dit --name=glee2 --hostname='glee2' --network=glee-net --ip=192.168.37.12 --privileged ubuntu:22.04 /bin/bash
sudo docker run -dit --name=glee3 --hostname='glee3' --network=glee-net --ip=192.168.37.13 --privileged ubuntu:22.04 /bin/bash
sudo docker run -dit --name=glee4 --hostname='glee4' --network=glee-net --ip=192.168.37.14 --privileged ubuntu:22.04 /bin/bash
sudo docker run -dit --name=glee5 --hostname='glee5' --network=glee-net --ip=192.168.37.15 --privileged ubuntu:22.04 /bin/bash


sudo docker run -dit --name=gleek --hostname='gleek' --network=glee-net --ip=192.168.37.13 --privileged ubuntu:22.04 /bin/bash

## 检查容器创建状态
sudo docker ps
1.3 进入 Docker 内部设置时延
## 依次进入容器 1/2/3 ，进行下列几项操作……
sudo docker exec -it glee1 /bin/bash

## 更新apt
apt-get update 
apt-get upgrade

## 安装
apt-get install wget net-tools git gcc \
telnet systemd  vim lsof make iproute2 \
autoconf libtool automake iputils-ping

## 设置时延后验证：
## -c3 是输出条数，可以不设置
ping 192.168.37.12 -c3

## 以上四步，需安装完所有容器后进行后面的操作
此时已经构建了一个 k 个节点的集群。
## 退出容器
exit
1.4 安装 Go
在服务器上安装go 。 推荐version:1.20.6。
此时已经做好了一切准备。
# 2. 编译文件
2.1 得到可执行文件：
./build 
## or use instruction:   make
可执行文件在 etcd and etcd_glee 文件路径的 /bin 目录下，
# 3. 搭建集群
3.1 把执行文件放进集群
## 把可执行文件放入容器：
## 这里是在五节点实验文件夹下，所以上面需要有对应五个节点的容器,执行raft：
cd glee-lab/glee-etcd/extantion_lab/five
sudo ./check_dir_and_copy_file_ETCD.sh
3.2 运行并检查
需要先将上一步得到的可执行文件放到 k 个 docker中去，模拟 k 节点的实验，以 glee-etcd/extantion-lab/five/  文件夹为例，做5节点实验。
## 运行集群：
sudo ./run_etcd.sh

## 检查集群状态（在docker外）
## 三节点为例
ETCDCTL_API=3 ../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379 endpoint status -w table --command-timeout=1s

Output:
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
|      ENDPOINT      |        ID        | VERSION | DB SIZE | IS LEADER | IS LEARNER | RAFT TERM | RAFT INDEX | RAFT APPLIED INDEX | ERRORS |
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
| 192.168.37.11:2379 | 60fca98a3ea73cee |  3.4.28 |   20 kB |      true |      false |         4 |         12 |                 12 |        |
| 192.168.37.12:2379 | 3a530ef4d387f8ce |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
| 192.168.37.13:2379 | c4696bb3330d5ade |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+

## 五节点为例（API=3不是节点个数！ETCDCTL_API=3 是为了确保使用 etcdctl 时，使用 etcd v3）
ETCDCTL_API=3 ../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379,192.168.37.14:2379,192.168.37.15:2379 endpoint status -w table --command-timeout=1s

Output:
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
|      ENDPOINT      |        ID        | VERSION | DB SIZE | IS LEADER | IS LEARNER | RAFT TERM | RAFT INDEX | RAFT APPLIED INDEX | ERRORS |
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
| 192.168.37.11:2379 | 60fca98a3ea73cee |  3.4.28 |   20 kB |      true |      false |         4 |         12 |                 12 |        |
| 192.168.37.12:2379 | 3a530ef4d387f8ce |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
| 192.168.37.13:2379 | c4696bb3330d5ade |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
| 192.168.37.14:2379 | 2d41c5cc4bbd68c0 |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
| 192.168.37.15:2379 | 925867490973fe6d |  3.4.28 |   20 kB |     false |      false |         4 |         12 |                 12 |        |
+--------------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
此时已经将可执行文件（glee and rtcd版本的raft）copy 到了五个docker模拟的节点中，时延已经在文件中设置，并打印和检查了五个节点的状态。默认，节点一是领导者（节点一最先启动，获得选票）。
# 4. 实验测试
4.1  Load data
## 进入 go-ycsb-modified 目录
## load 10000 条数据,放到当前目录下 > result1.log ，此时需要几分钟，执行完成后检查 result1.log
sudo ./bin/go-ycsb load etcd -P basic1.properties -P workloads/workloada -p threadcount=4 -p recordcount=10000 -p measurementtype=raw > result1.log
这里没有写输出，等待几分钟 load 数据就好。为了测试和对比方便，可以另外新建一个文件放置load数据也行。
4.2 Run
## run : operationcount <=  recordcount
sudo ./bin/go-ycsb run etcd -P basic1.properties -P workloads/workloada -p threadcount=4 -p operationcount=10000 -p measurementtype=raw > result1.log
这里设置了线程为4，负载为workloada()
