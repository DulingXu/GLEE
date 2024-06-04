#!/bin/bash

# 定义容器IP地址
ip2="192.168.37.12"
ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"

# 进入 glee1 容器
sudo docker exec -i glee1 /bin/bash -c '

time12="27ms"
time13="59ms"
time14="31ms"
time15="67ms"
time16="46ms"
time17="26ms"

ip2="192.168.37.12"
ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 9

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time12
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time12 5ms

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time13
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time13 5ms

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time14
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time14 5ms

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time15
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time15 5ms

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time16
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time16 5ms

# 在队列上创建分类，句柄编号 90:0，父类编号 1:9，延迟时间 time17
tc qdisc add dev eth0 parent 1:9 handle 90: netem delay $time17 5ms


# 处理 glee1 到 glee2 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip2 flowid 1:4

# 处理 glee1 到 glee3 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip3 flowid 1:5

# 处理 glee1 到 glee4 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip4 flowid 1:6

# 处理 glee1 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:7

# 处理 glee1 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:8

# 处理 glee1 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:9

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee2 容器
sudo docker exec -i glee2 /bin/bash -c '

time23="33ms"
time24="22ms"
time25="42ms"
time26="23ms"
time27="30ms"

ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 8

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time23 
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time23 5ms

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time24
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time24 5ms

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time25
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time25 5ms

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time26
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time26 5ms

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time27
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time27 5ms


# 处理 glee2 到 glee3 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip3 flowid 1:4

# 处理 glee2 到 glee4 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip4 flowid 1:5

# 处理 glee2 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:6

# 处理 glee2 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:7

# 处理 glee2 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:8

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee3 容器
sudo docker exec -i glee3 /bin/bash -c '

time34="41ms"
time35="23ms"
time36="24ms"
time37="48ms"

ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 7

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time34
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time34 5ms

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time35
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time35 5ms

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time36
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time36 5ms

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time37
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time37 5ms


# 处理 glee3 到 glee4 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip4 flowid 1:4

# 处理 glee3 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:5

# 处理 glee3 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:6

# 处理 glee3 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:7

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee4 容器
sudo docker exec -i glee4 /bin/bash -c '

time45="36ms"
time46="14ms"
time47="8ms"

ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 6

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time45
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time45 5ms

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time46
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time46 5ms

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time47
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time47 5ms

# 处理 glee4 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:4

# 处理 glee4 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:5

# 处理 glee4 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:6

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee5 容器
sudo docker exec -i glee5 /bin/bash -c '

time56="21ms"
time57="43ms"

ip6="192.168.37.16"
ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 5

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time56
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time56 5ms

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time57
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time57 5ms

# 处理 glee5 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:4

# 处理 glee5 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:5

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee6 容器
sudo docker exec -i glee6 /bin/bash -c '

time67="24ms"

ip7="192.168.37.17"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 4

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time67
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time67 5ms

# 处理 glee6 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:4

# 显示设置的延迟规则
tc qdisc show dev eth0
'
