# mysql overview

# mysql instalation

 ```
 
    sudo yum remove -y mysql-server
    sudo yum remove -y mysql
    
    mysql 5.5
    sudo yum install http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm
    
    # mysql 5.6
    sudo service mysqld start
    mysqld --skip-grant-tables
    sudo mysql --user=root mysql
    UPDATE user SET password=PASSWORD('mysql') where USER='root';
    flush privileges;
    sudo service mysql restart
    
    mysql 5.7
    sudo yum localinstall http://repo.mysql.com/yum/mysql-5.7-community/el/7/x86_64/mysql57-community-release-el7-10.noarch.rpm
    
    yum repolist | grep mysql
    sudo yum-config-manager --enable mysql57-community
    sudo yum install -y mysql-community-server
    sudo service mysqld start
    sudo service mysqld status
    sudo grep 'temporary password' /var/log/mysqld.log
    mysql -uroot -p
    mysql
    mysql_upgrade -u root -p --force
    systemctl restart mysqld
    
    SHOW VARIABLES LIKE 'validate_password%'
    mysql>uninstall plugin validate_password
    set password for 'root'@'localhost' = PASSWORD('mysql');
    flush privileges;
    
    # fatal-error start with root 
    sudo /etc/init.d/mysql stop
    /usr/local/mysql/bin/mysqladmin --port=8889 -u root shutdown
 ```
 
# Reference

  - [mysql 5.5 installation on centos](https://samzong.me/2016/07/07/how-to-install-mysql-5-6-on-centos/)
  - [mysql 5.7 installation on centos](s )
  - [mysql how to fix Access denied for user 'root'@'localhost'](https://superuser.com/questions/603026/mysql-how-to-fix-access-denied-for-user-rootlocalhost ) 
  - [Fatal error: Please read "Security" section of the manual to find out how to run mysqld as root](https://stackoverflow.com/questions/25700971/fatal-error-please-read-security-section-of-the-manual-to-find-out-how-to-run)
  - [cannot-touch-var-log-mysqld-log-permission-denied](https://stackoverflow.com/questions/29004285/cannot-touch-var-log-mysqld-log-permission-denied )
  - [Changed limits: max_open_files: 1024 ](https://stackoverflow.com/questions/32760202/buffered-warning-changed-limits-max-connections-214-requested-800)
  - [Table 'performance_schema.session_variables' doesn't exist](https://stackoverflow.com/questions/31967527/table-performance-schema-session-variables-doesnt-exist )