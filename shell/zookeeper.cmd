# start a server

    ./zkServer.sh start
    
# run in the background

    ./zkServer.sh start-foreground
    
# run a clinet

    ./zkCli.sh -server 192.168.145.108:2181
    
    java.io.IOException: Packet len13379956 is out of range!
    <a href="https://stackoverflow.com/questions/10249579/zookeeper-cli-failing-ioexception-packet-len12343123123-is-out-of-range?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa">zookeeper packet is out of range</a>
    
    call %JAVA% "-Dzookeeper.log.dir=%ZOO_LOG_DIR%" "-Dzookeeper.root.logger=%ZOO_LOG4J_PROP%" "-Djute.maxbuffer=49107800" -cp "%CLASSPATH%" %ZOOMAIN% %*
    
    中的"-Djute.maxbuffer=49107800"
    
# zkcli command line console 中的帮助命令

   help