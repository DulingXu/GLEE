#!/bin/bash


# 新的延迟时间（以毫秒为单位）
new_delay1="35ms"
new_delay2="40ms"

new_delay3="40ms"
new_delay4="20ms"
new_delay5="25ms"

new_delay6="15ms"
new_delay7="20ms"
new_delay8="25ms"


# 使用 tc qdisc change 命令修改现有队列的延迟时间
sudo docker exec -i glee1 /bin/bash -c "tc qdisc change dev eth0 parent 1:4 handle 40: netem delay $new_delay1;tc qdisc change dev eth0 parent 1:5 handle 50: netem delay $new_delay2"

# 显示修改后的延迟规则
sudo docker exec -i glee1 /bin/bash -c "tc qdisc show dev eth0"

sleep 300

# 使用 tc qdisc change 命令修改现有队列的延迟时间
sudo docker exec -i glee1 /bin/bash -c "tc qdisc change dev eth0 parent 1:4 handle 40: netem delay $new_delay3;tc qdisc change dev eth0 parent 1:5 handle 50: netem delay $new_delay4"
sudo docker exec -i glee2 /bin/bash -c "tc qdisc change dev eth0 parent 1:5 handle 50: netem delay $new_delay5"

# 显示修改后的延迟规则
sudo docker exec -i glee1 /bin/bash -c "tc qdisc show dev eth0"
sudo docker exec -i glee2 /bin/bash -c "tc qdisc show dev eth0"

sleep 300

# 使用 tc qdisc change 命令修改现有队列的延迟时间
sudo docker exec -i glee1 /bin/bash -c "tc qdisc change dev eth0 parent 1:4 handle 40: netem delay $new_delay6;tc qdisc change dev eth0 parent 1:5 handle 50: netem delay $new_delay7"
sudo docker exec -i glee2 /bin/bash -c "tc qdisc change dev eth0 parent 1:5 handle 50: netem delay $new_delay8"

# 显示修改后的延迟规则
sudo docker exec -i glee1 /bin/bash -c "tc qdisc show dev eth0"
sudo docker exec -i glee2 /bin/bash -c "tc qdisc show dev eth0"