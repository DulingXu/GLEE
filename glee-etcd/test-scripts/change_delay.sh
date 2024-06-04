#!/bin/bash


# 新的延迟时间（以毫秒为单位）
new_delay1="15ms"
sleep 200

# 使用 tc qdisc change 命令修改现有队列的延迟时间
sudo docker exec -i glee1 /bin/bash -c "tc qdisc change dev eth0 parent 1:4 handle 40: netem delay $new_delay1"

# 显示修改后的延迟规则
sudo docker exec -i glee1 /bin/bash -c "tc qdisc show dev eth0"