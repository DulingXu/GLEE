#!/bin/bash

# Loop through run_large1.sh to run_large9.sh and execute each script
for i in {1..9}
do
    ./run_large$i.sh
done
