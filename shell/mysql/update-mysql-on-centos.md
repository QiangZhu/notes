# update mysql

  ```
    ps -ef|grep mysql
    sudo service mysql stop
    yum repolist all | grep mysql
    sudo yum-config-manager --disable mysql56-community
    sudo yum-config-manager --enable mysql57-community
    sudo yum update && yum install yum-utils
    sudo yum install yum-confing-manager
    

  ```


# reference

 - [update mysql](https://dev.mysql.com/doc/refman/8.0/en/updating-yum-repo.html )