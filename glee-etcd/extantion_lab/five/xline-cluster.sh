ETCDCTL_API=3 ../../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379,192.168.37.14:2379,192.168.37.15:2379 endpoint status -w table --command-timeout=1s
ETCDCTL_API=3 ../../bin/etcdctl --endpoints=192.168.37.11:2379,192.168.37.12:2379,192.168.37.13:2379,192.168.37.14:2379,192.168.37.15:2379 endpoint health
