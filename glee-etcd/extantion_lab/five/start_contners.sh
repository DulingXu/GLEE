#!/bin/bash

CONTAINERS=("glee1" "glee2" "glee3" "glee4" "glee5")

for container in ${CONTAINERS[@]} 
do
    if docker inspect -f '{{.State.Running}}' "$container" &>/dev/null; then
        echo "$container is running, restarting it..."
        sudo docker restart "$container"
    else
        echo "$container is not running, starting it..."
        sudo docker start "$container"
    fi
done