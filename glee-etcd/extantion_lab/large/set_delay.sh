#!/bin/bash

# 定义容器IP地址
ip2="192.168.37.12"
ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 进入 glee1 容器
sudo docker exec -i glee1 /bin/bash -c '

time12="27ms"
time13="59ms"
time14="31ms"
time15="67ms"
time16="46ms"
time17="26ms"
time18="38ms"
time19="29ms"

ip2="192.168.37.12"
ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 10

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time12
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time12 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time13
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time13 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time14
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time14 

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time15
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time15 

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time16
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time16 

# 在队列上创建分类，句柄编号 90:0，父类编号 1:9，延迟时间 time17
tc qdisc add dev eth0 parent 1:9 handle 90: netem delay $time17 

# 在队列上创建分类，句柄编号 20:0，父类编号 1:2，延迟时间 time18
tc qdisc add dev eth0 parent 1:2 handle 20: netem delay $time18 

# 在队列上创建分类，句柄编号 30:0，父类编号 1:3，延迟时间 time19
tc qdisc add dev eth0 parent 1:3 handle 30: netem delay $time19 

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

# 处理 glee1 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:2

# 处理 glee1 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:3

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
time28="51ms"
time29="43ms"

ip3="192.168.37.13"
ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 9

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time23 
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time23 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time24
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time24 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time25
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time25 

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time26
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time26 

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time27
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time27 

# 在队列上创建分类，句柄编号 20:0，父类编号 1:2，延迟时间 time28
tc qdisc add dev eth0 parent 1:2 handle 20: netem delay $time28 

# 在队列上创建分类，句柄编号 30:0，父类编号 1:3，延迟时间 time29
tc qdisc add dev eth0 parent 1:3 handle 30: netem delay $time29 

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

# 处理 glee2 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:2

# 处理 glee2 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:3

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
time38="67ms"
time39="59ms"

ip4="192.168.37.14"
ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 10

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time34
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time34 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time35
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time35 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time36
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time36 

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time37
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time37 

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time38
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time38 

# 在队列上创建分类，句柄编号 90:0，父类编号 1:9，延迟时间 time39
tc qdisc add dev eth0 parent 1:9 handle 90: netem delay $time39 

# 处理 glee3 到 glee4 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip4 flowid 1:4

# 处理 glee3 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:5

# 处理 glee3 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:6

# 处理 glee3 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:7

# 处理 glee3 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:8

# 处理 glee3 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:9

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee4 容器
sudo docker exec -i glee4 /bin/bash -c '

time45="36ms"
time46="14ms"
time47="8ms"
time48="32ms"
time49="22ms"

ip5="192.168.37.15"
ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 9

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time45
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time45 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time46
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time46 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time47
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time47 

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time48
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time48 

# 在队列上创建分类，句柄编号 80:0，父类编号 1:8，延迟时间 time49
tc qdisc add dev eth0 parent 1:8 handle 80: netem delay $time49 

# 处理 glee4 到 glee5 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip5 flowid 1:4

# 处理 glee4 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:5

# 处理 glee4 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:6

# 处理 glee4 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:7

# 处理 glee4 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:8

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee5 容器
sudo docker exec -i glee5 /bin/bash -c '

time56="21ms"
time57="43ms"
time58="68ms"
time59="57ms"

ip6="192.168.37.16"
ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 8

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time56
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time56 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time57
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time57 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time58
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time58 

# 在队列上创建分类，句柄编号 70:0，父类编号 1:7，延迟时间 time59
tc qdisc add dev eth0 parent 1:7 handle 70: netem delay $time59 

# 处理 glee5 到 glee6 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip6 flowid 1:4

# 处理 glee5 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:5

# 处理 glee5 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:6

# 处理 glee5 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:7

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee6 容器
sudo docker exec -i glee6 /bin/bash -c '

time67="24ms"
time68="46ms"
time69="36ms"

ip7="192.168.37.17"
ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 7

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time67
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time67 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time68
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time68 

# 在队列上创建分类，句柄编号 60:0，父类编号 1:6，延迟时间 time69
tc qdisc add dev eth0 parent 1:6 handle 60: netem delay $time69 

# 处理 glee6 到 glee7 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip7 flowid 1:4

# 处理 glee6 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:5

# 处理 glee6 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:6

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee7 容器
sudo docker exec -i glee7 /bin/bash -c '

time78="23ms"
time79="14ms"

ip8="192.168.37.18"
ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 6

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time78
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time78 

# 在队列上创建分类，句柄编号 50:0，父类编号 1:5，延迟时间 time79
tc qdisc add dev eth0 parent 1:5 handle 50: netem delay $time79 

# 处理 glee7 到 glee8 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip8 flowid 1:4

# 处理 glee7 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:5

# 显示设置的延迟规则
tc qdisc show dev eth0
'
sleep 2

# 进入 glee8 容器
sudo docker exec -i glee8 /bin/bash -c '

time89="11ms"

ip9="192.168.37.19"

# 删除之前可能存在的规则
tc qdisc del dev eth0 root

# 为网卡 eth0 绑定一个队列 qdisc，根类编号 1:0
tc qdisc add dev eth0 root handle 1: prio bands 5

# 在队列上创建分类，句柄编号 40:0，父类编号 1:4，延迟时间 time89
tc qdisc add dev eth0 parent 1:4 handle 40: netem delay $time89 

# 处理 glee8 到 glee9 的网络延迟
tc filter add dev eth0 protocol ip parent 1:0 prio 4 u32 match ip dst $ip9 flowid 1:4

# 显示设置的延迟规则
tc qdisc show dev eth0
'
