# start a server

    ```
    ./zkServer.sh start
    ```
    
# run in the background

    ```
    ./zkServer.sh start-foreground
    ```
    
# run a clinet

    ```
    ./zkCli.sh -server 192.168.145.108:2181
    ```
    
    java.io.IOException: Packet len13379956 is out of range! 
    call %JAVA% "-Dzookeeper.log.dir=%ZOO_LOG_DIR%" \ 
                "-Dzookeeper.root.logger=%ZOO_LOG4J_PROP%" \
                "-Djute.maxbuffer=49107800" \
                -cp "%CLASSPATH%" %ZOOMAIN% %*
    
   "-Djute.maxbuffer=49107800"
    
# zkcli command line console 中的帮助命令

   ```
   help
   ```
#  create a znode called /workers

    ```
    create /workers ""
    ```
    
#  create a emphemeral znode /master

    ```
   create -e /master "master1.example.com:2223"
   ```
   
 # delete z znode called /workers
 
    ```
    delete /workers 
    ```
    
 # get the metadata and data of the /master znode
 
    ```
    get /master
    ```