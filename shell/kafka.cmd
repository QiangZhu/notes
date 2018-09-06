# help

## ./kafka-topics.sh --help

# windows
  kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
  kafka-console-producer.bat --broker-list 127.0.0.1:9092 --topic test
  kafka-console-consumer.bat --bootstrap-server 127.0.0.1:9092 --topic test

# Topic
  
  kafka-topics.sh

## 创建Topic

    ./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --create --replication-factor 2 --partitions 2 --topic test-kafka-topic

## 修改Topic的partition的数目

    ./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --alter --topic test-kafka-topic --partitions 3

## 获取Topic的列表

    ./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --list

## 查看指定Topic的详情

    ./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --describe --topic test-kafka-topic

## 删除Topic

    ./kafka-topics.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --delete --topic test-kafka-topic

# 调整分区(目前还未验证成功--待更新)

  kafka-reassign-partitions.sh

## 生成分区计划
 
    首先要确认topic的当前分区的位置
    比如 ：Topic: test-kafka-topic Partition: 0    Leader: 2       Replicas: 2     Isr: 2
           表明分区只有一个位于id=2的broker上
    现在计划调整test-kafka-topic到0上
    ./kafka-reassign-partitions.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --test-kafka-topic-json-file test-kafka-topic.json --broker-list "0"  -generate

## 验证分区计划

    ./kafka-reassign-partitions.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --reassignment-json-file test-kafka-topic.json --verify
    

## 执行分区计划

   ./kafka-reassign-partitions.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --reassignment-json-file test-kafka-topic.json --execute
   
# 调整Replica(未验证)

  ./kafka-preferred-replica-election.sh --zookeeper 192.168.145.108:2181,192.168.145.109:2181,192.168.145.110:2181 --path-to-json /tmp/topicPartitionList.json
  

   