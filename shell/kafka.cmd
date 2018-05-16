# Topic

## 创建Topic
./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --create --replication-factor 2 --partitions 2 --topic test-kafka-create-topic

## 修改Topic的partition的数目
./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --alter --topic test-kafka-create-topic --partitions 3

## 获取Topic的列表
./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --list

## 查看指定Topic的详情
./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --describe --topic test-kafka-create-topic

## 删除Topic
./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --delete --topic test-kafka-create-topic