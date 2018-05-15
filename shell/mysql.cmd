# foreign key
ALTER TABLE `yx_messagecenter_channel_meta_parameter` ADD CONSTRAINT `FK_MESSAGECENTERCHANNELMETAPARAMETER_METADEFINITIONCODE` FOREIGN KEY (`meta_definition_code`) REFERENCES `yx_messagecenter_channel_meta_definition`(`code`);

# copy table
create table yx_messagecenter_channel_meta_parameter_export as select * from yx_messagecenter_channel_meta_parameter where meta_definition_code in ('sms_baidu','sms_baiwu_v1','sms_baiwu_v2','sms_guodu');

#sms 对账统计详情sql
select 
id,
JSON_EXTRACT(data,'$.content') as content,
JSON_EXTRACT(data,'$.channelType') as channeltype,
CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) as sms_content_length,
(
	CASE
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) <= 72 THEN 1
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) > 72  THEN (CASE WHEN MOD((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72),67) = 0 THEN ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72) DIV 67) +1  ELSE ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72) DIV 67) +2 end)	
	END
) AS sms_send_number,
status,
send_time,
sender_channel
from yx_message
where 
status=1
and type=1 
and send_time like '2017-12-%' 
and (JSON_EXTRACT(data,'$.channelType') = 3 or JSON_EXTRACT(data,'$.channelType') = 'sms_yxkk')
limit 10

# sms对账统计汇总
select 
SUM((
	CASE
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) <= 72 THEN 1
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) > 72  THEN (CASE WHEN MOD((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72),67) = 0 THEN ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72) DIV 67) +1  ELSE ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))-72) DIV 67) +2 end)	
	END
)) AS sms_send_number
from yx_message
where 
status=1
and type=1 
and send_time like '2017-12-%' 
and (JSON_EXTRACT(data,'$.channelType') = 3 or JSON_EXTRACT(data,'$.channelType') = 'sms_yxkk')

# 注意4是sms_yxkk签名【淘车】的修正值
select 
id,
JSON_EXTRACT(data,'$.content') as content,
JSON_EXTRACT(data,'$.channelType') as channeltype,
CHAR_LENGTH(JSON_EXTRACT(data,'$.content')) as sms_content_length,
(
	CASE
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))+4 <= 72 THEN 1
		WHEN CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))+4 > 72  THEN (CASE WHEN MOD((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))+4-72),67) = 0 THEN ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))+4-72) DIV 67) +1  ELSE ((CHAR_LENGTH(JSON_EXTRACT(data,'$.content'))+4-72) DIV 67) +2 end)	
	END
) AS sms_send_number,
status,
send_time,
sender_channel
from yx_message
where 
status=1
and type=1 
and send_time like '2018-01-%' 
and (JSON_EXTRACT(data,'$.channelType') = 3 or JSON_EXTRACT(data,'$.channelType') = 'sms_yxkk')
order by send_time desc 
limit 10


# forgot mysql passowrd in centos7 https://stackoverflow.com/questions/33510184/change-mysql-root-password-on-centos7
#1. Stop mysql:
systemctl stop mysqld
#2. Set the mySQL environment option 
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
#3. Start mysql usig the options you just set
systemctl start mysqld
#4. Login as root
mysql -u root
#5. Update the root user password with these mysql commands
mysql> UPDATE mysql.user SET authentication_string = PASSWORD('mysql') WHERE User = 'root' AND Host = 'localhost';
mysql> FLUSH PRIVILEGES;
mysql> quit
#6. Stop mysql
systemctl stop mysqld
#7. Unset the mySQL envitroment option so it starts normally next time
systemctl unset-environment MYSQLD_OPTS
#8. Start mysql normally:
systemctl start mysqld
#9 Try to login using your new password:
mysql -u root -p

innodb_flush_log_at_trx_commit
show variables like 'innodb_flush_%';
