# openssh
    检查openssh
		cat /etc/sysconfig/SuSEfirewall2.d/ |grep sshd
		netstat -an | grep :22
		which sshd
	Enabling the SSHD Daemon
		su -
		systemctl enable sshd.service
	To Start the Service
		systemctl start sshd.service
	To check firewall
	    cat /etc/sysconfig/SuSEfirewall2 | grep sshd
	To shutdown firewall
	   su - 
	   iptables -F
	[How to enable ssh on startup in opensuse](https://serverfault.com/questions/766676/how-to-enable-ssh-on-startup-in-opensuse)
	
# nodejs

    check nodejs
		npm --version
	install
	    zypper install nodejs
		
# MySQL
	是否已安装MySQL
		rpm -qa | grep mysql
	删除已安装的MySQL
		rpm -ev MySQL-server-5.0.22-0.i386
		rpm -ev MySQL-client-5.0.22-0.i386
	下载
		wget -c  http://mirrors.sohu.com/mysql/MySQL-5.6/MySQL-server-5.6.22-1.sles11.x86_64.rpm
		wget -c  http://mirrors.sohu.com/mysql/MySQL-5.6/MySQL-client-5.6.22-1.sles11.x86_64.rpm
		wget -c  http://mirrors.sohu.com/mysql/MySQL-5.6/MySQL-devel-5.6.22-1.sles11.x86_64.rpm  
	安装
		rpm -ivh MySQL-server-5.6.22-1.sles11.x86_64.rpm
		rpm -ivh MySQL-client-5.6.22-1.sles11.x86_64.rpm
		rpm -ivh MySQL-devel-5.6.22-1.sles11.x86_64.rpm
	登录
		mysql -u root -p
	重新设置密码
		SET PASSWORD = PASSWORD('suse') ;
	编辑my.cnf修改字符集
		[client]
		port=3306
		default-character-set=utf8
		[mysqld]
		port=3306
		character_set_server=utf8  
		character_set_client=utf8  
		collation-server=utf8_general_ci 
		lower_case_table_names=0 
		datadir=/home/data/mysql 
		socket=/home/data/mysql/mysql.sock
		[mysql]
		default-character-set=utf8
	重启
		service mysql restart
	