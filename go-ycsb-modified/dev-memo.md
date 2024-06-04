## 编译指令
`make`

## 生成数据及请求
生成内容输出到`./dataset/`目录下

./bin/go-ycsb collect etcd -P workloads/workload-ext

### 命名格式
数据集
`{recordCount}-{insertProportion}-{readProportion}-{updateProportion}-{scanProportion}-{requestDistribution}.json`
