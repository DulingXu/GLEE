#!/bin/bash

# Loop through run_large1.sh to run_large9.sh and execute each script
./run_large3.sh
for i in {1..2}
do
    ./run_large$i.sh
done
./run_large9.sh
for i in {5..9}
do
    ./run_large$i.sh
done
~
