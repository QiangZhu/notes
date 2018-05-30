# start a server

    ```
    ./zkServer.sh start
    
    ./bin/zkServer.sh start ./conf/z1.cfg
    ```
# stop a server

  ```
   ./bin/zkServer.sh stop ./conf/z1.cfg
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
   
   使用 get /master 获得元数据
   
   ephemeralOwner = 0x3638ac95bd60000 

   其中"3638ac95bd60000"是 ephemeral所有者sessionid
   
 # delete z znode called /workers
 
    ```
    delete /workers 
    ```
    
 # get the metadata and data of the /master znode
 
    ```
    get /master
    ```
    
 #  the stat command gets the attributes of a znode and allows us to set a watch
   on the existence of the znode
   
   ```
    stat /master true
   ```
   
   WatchedEvent state:SyncConnected type:NodeDeleted path:/master
   
 # telnet + stat to show the clients
 
   ```
     telnet 192.168.2.169 2181
     stat
   ```
   
 # telnet + dump to show the active sessions
 
    ```
      telent 192.168.2.169 2181
      dump
    ```
    
 # used DigestAuthenticationProvider to generate a digest for password secret
 
   ```
     java -cp ./zookeeper-3.4.9.jar:./lib/log4j-1.2.16.jar: \
     ./lib/slf4j-api-1.6.1.jar:./lib/slf4j-log4j12-1.6.1.jar \
     org.apache.zookeeper.server.auth.DigestAuthenticationProvider test:test
     
     test:test->test:V28q/NynI4JI3Rk54h0r8O5kMug=

   ```
    
    ```
      echo -n test:test | openssl dgst -binary -sha1 | openssl base64 
   
      V28q/NynI4JI3Rk54h0r8O5kMug=

    ```

# ZooKeeper ACL authentication

  ```
     addauth scheme auth
     getAcl path
     setAcl path
  
     https://www.jianshu.com/p/147ca2533aff
     
     scheme: world | auth | digest | host | ip 
     
     zkCli -server login 
     
  ```
  - scheme:auth
     
      ```
        create /auth auth
        addauth digest test:test #使用acl
        setAcl /auth auth:test:test:rwadc
        getAcl /auth  
      ```
      
        做了acl之后对当前的acl有效，如果close之后，需要使用addauth命令之后，才能
        访问被acl的目录否则会报
        Authentication is not valid   : /XXXXXXX

  - scheme:digest
  
     ```
        create /digest digest
        addauth digest test:test #使用acl
        setAcl /digest digest:test:V28q/NynI4JI3Rk54h0r8O5kMug=:rwadc
        getAcl /digest 
      ```
     
  - scheme:ip
   
    ```
       create /111
       setAcl /111 ip:192.168.2.111:rwcda
       getAcl /111
    ```    