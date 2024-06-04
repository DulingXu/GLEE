./bin/go-ycsb load etcd -P ./basic.properties -P workloads/workloada -p threadcount=5 
./bin/go-ycsb run etcd -P ./basic.properties -P workloads/workloada -p threadcount=5 -p recordcount=10000 -p operationcount=1000000 
