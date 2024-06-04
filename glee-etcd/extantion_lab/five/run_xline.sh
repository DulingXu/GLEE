docker exec -d glee1 /expr/xline --name xline1 --storage-engine rocksdb   --members xline1=192.168.37.11:2379,xline2=192.168.37.12:2379,xline3=192.168.37.13:2379,xline4=192.168.37.14:2379,xline5=192.168.37.15:2379  --data-dir data

docker exec -d glee2 /expr/xline --name xline2 --storage-engine rocksdb   --members xline1=192.168.37.11:2379,xline2=192.168.37.12:2379,xline3=192.168.37.13:2379,xline4=192.168.37.14:2379,xline5=192.168.37.15:2379  --data-dir data

docker exec -d glee3 /expr/xline --name xline3 --storage-engine rocksdb   --members xline1=192.168.37.11:2379,xline2=192.168.37.12:2379,xline3=192.168.37.13:2379,xline4=192.168.37.14:2379,xline5=192.168.37.15:2379  --data-dir data

docker exec -d glee4 /expr/xline --name xline4 --storage-engine rocksdb   --members xline1=192.168.37.11:2379,xline2=192.168.37.12:2379,xline3=192.168.37.13:2379,xline4=192.168.37.14:2379,xline5=192.168.37.15:2379  --data-dir data

docker exec -d glee5 /expr/xline --name xline5 --storage-engine rocksdb   --members xline1=192.168.37.11:2379,xline2=192.168.37.12:2379,xline3=192.168.37.13:2379,xline4=192.168.37.14:2379,xline5=192.168.37.15:2379  --data-dir data

