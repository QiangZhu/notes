# mysql overview

# mysql instalation

 ```
 mysql-server-5.5.repo for CentOS/RHEL 7.x
    sudo yum install http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm
    
    sudo yum remove -y mysql-server
    sudo yum remove -y mysql*
    
    sudo yum install -y mysql-community-server
    
    sudo service mysql start
    mysqld --skip-grant-tables
    sudo mysql --user=root mysql
    UPDATE user SET Password=PASSWORD('mysql') where USER='root';
    flush privileges;
    sudo service mysql restart
 ```
 
# Reference

  - [mysql 5.5 installation on centos](https://samzong.me/2016/07/07/how-to-install-mysql-5-6-on-centos/)
  - [mysql how to fix Access denied for user 'root'@'localhost'](https://superuser.com/questions/603026/mysql-how-to-fix-access-denied-for-user-rootlocalhost ) 