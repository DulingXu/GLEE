import os
import sys
argvs = sys.argv
threads = [4,8,16,20,32,64,128,256,512,1024,2048]
# workloads = ['workloada','workloadb','workloadc','workloadd','workloade']
workloads = ['workloada','workloadb','workloadc']
# workloads = ['workloadc']

ycsb_cmds = ""

record_count = 10000
operation_count = 10000
etcd_endpoints="192.168.37.11:2379"
etcd_dial_timeout="1s"


for workload_type in workloads:
    if argvs[1] == "load":
        print("==="+workload_type+"===")
        print("INTO LOAD PHASE")
        ycsb_cmds = "../bin/go-ycsb load etcd -P ../basic.properties  "
        workload_file = "-P ../workloads/" + workload_type
        threads_para = " -p threadcount=20"
        ycsb_cmds = ycsb_cmds+ workload_file + threads_para
        ycsb_cmds = ycsb_cmds+" -p recordcount=" + str(record_count)
        print(ycsb_cmds)
        os.system(ycsb_cmds)

    elif argvs[1] == "run":
        for i in threads:
            print("INTO RUN PHASE")
            ycsb_cmds = "../bin/go-ycsb run etcd -P ../basic.properties  "
            workload_file = "-P ../workloads/" + workload_type
            threads_para = " -p threadcount=" + str(i)
            ycsb_cmds = ycsb_cmds+ workload_file + threads_para
            ycsb_cmds = ycsb_cmds+" -p recordcount=" + str(record_count)
            ycsb_cmds = ycsb_cmds+" -p operationcount=" + str(operation_count)
            ycsb_cmds = ycsb_cmds+ " > "+"../results/latency-"+workload_type+"-"+str(operation_count)+"-t"+str(i)+".log"
            print(ycsb_cmds)
            os.system(ycsb_cmds)

