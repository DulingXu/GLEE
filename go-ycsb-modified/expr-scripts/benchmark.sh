# ./bin/go-ycsb run etcd -P basic.properties  -P workloads/workload-ext -p threadcount=5
# ./bin/go-ycsb run etcd -P basic.properties  -P workloads/workload-ext -p threadcount=10
# ./bin/go-ycsb run etcd -P basic.properties  -P workloads/workload-ext -p threadcount=20
# ./bin/go-ycsb run etcd -P basic.properties  -P workloads/workload-ext -p threadcount=30
# ./bin/go-ycsb run etcd -P basic.properties  -P workloads/workload-ext -p threadcount=40

./bin/go-ycsb run etcd -P basic.properties  -P workloads/workloadb -p threadcount=5
./bin/go-ycsb run etcd -P basic.properties  -P workloads/workloadb -p threadcount=10
./bin/go-ycsb run etcd -P basic.properties  -P workloads/workloadb -p threadcount=20
./bin/go-ycsb run etcd -P basic.properties  -P workloads/workloadb -p threadcount=30
./bin/go-ycsb run etcd -P basic.properties  -P workloads/workloadb -p threadcount=40