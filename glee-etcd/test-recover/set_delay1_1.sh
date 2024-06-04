#!/bin/bash

# 进入 glee1 容器
sudo docker exec -i glee1 /bin/bash -c '
# 定义延迟时间（以毫秒为单位）
time12="25ms"
time13="30ms"

# 定义容器IP地址
ip2="192.168.37.12"
ip3="192.168.37.13"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 5

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time12
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time12

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time13
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time13

# 处理 glee1 到 glee2 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip2 flowid 1:4

# 处理 glee1 到 glee3 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip3 flowid 1:5

# 显示设置的延迟规则
tc qdisc show dev eth0
'
# 进入 glee2 容器
sudo docker exec -i glee2 /bin/bash -c '
# 定义延迟时间（以毫秒为单位）
time23="30ms"

# 定义容器IP地址
ip3="192.168.37.13"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 5

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time23
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time23

# 处理 glee2 到 glee3 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip3 flowid 1:5

# 显示设置的延迟规则
tc qdisc show dev eth0
'
