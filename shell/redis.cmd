AOF : Append Only File
backup
# For example, this configuration will make Redis automatically dump the dataset to disk every 60 seconds if at least 1000 keys changed:
SAVE 60 1000
# You can turn on the AOF in your configuration file
appendonly yes
# Fix the original file using the redis-check-aof tool that ships with Redis
redis-check-aof --fix

./redis-cli -h 127.0.0.1 -p 6380
./redis-server --appendonly yes

# version
redis-server --version

# redis cluster nodes
redis-cli cluster nodes

#/usr/local/redis/bin
redis-cli cluster slots

# info
>INFO
>INFO all

#
>PING
>ECHO 'Hello World'
>SET foo 100
>GET foo
>INCR foo
>DECR foo
>EXISTS foo
>DEL foo
>FLUSHALL
>EXPIRE foo 50
>TTL foo
>clear
>SETEX greeting 30 "Hello World!"
#PERSIST 命令使Expire不再有意义
>PERSIST greeting
>MSET key1 "Hello" key2 "World"
>APPEND key1 " World"
>RENAME key 1 greeting

>FLUSHALL
>LPUSH people "Brad"
>LPUSH people "Jen"
>LPUSH people "Tom"
>LRANGE people 0 -1
>LRANGE people 1 2
>RPUSH people "Harry"
>LLEN people
>LPOP people
>RPOP people
>LRANGE people 0 -1
>LINSERT people BEFORE "Brad" "Jerry"

>FLUSHADD
>clear
>SADD cars "ford"
>SADD cars "Honda"
>SADD cars "BMW"
>SISMEMBER cars "Ford"
>SMEMBERS cars
>SCAR cars
>SMOVE cars mycars "Ford"
>SMEMBERS cars
>SMEMBERS mycars
>SREM cars "BMW"
>SMEMBERS cars

>FLUSHADD
>clear
>ZADD users 1981 "Brad Traversy"
>ZADD users 1975 "John Doe"
>ZADD users 1990 "Mike Smith"
>ZADD users 1990 "Kate Rogers"
>ZRANK users "Mike Smith"
>ZRANGE users 0 -1
>ZINCRBY users 1 "John Doe"

>FLUSHADD
>clear
>HSET user:brad name "Brad Traversy"
>HSET user:brad emal "Brad@gmail.com"
>HGET user:brad name
>HGETALL user:brad
>HMSET user:john name "John Doe" email "john@yahoo.com" age 25
>HKEYS user:john
>HVALS user:john
>HINCRBY user:john age 1
>HDEL user:john age
>HLEN user:john

>SAVE

#List Command
>COMMAND

#STAT
>DBSIZE

#DEBUG
>DEBUG OBJECT key

#Cluster
>CLUSTER INFO
>CLUSTER NODES
>CLUSTER SLOTS
>CLUSTER SLAVES node-id

#Config
>config get *

#Stat
>dbsize

# How I can switch to AOF, if I'm currently using dump.rdb snapshots?
# There is a different procedure to do this in Redis 2.0 and Redis 2.2, as you can guess it's simpler in Redis 2.2 and does not require a restart at all.
# Redis >= 2.2
# Make a backup of your latest dump.rdb file.
# Transfer this backup into a safe place.
# Issue the following two commands:
redis-cli config set appendonly yes
redis-cli config set save ""
# Make sure that your database contains the same number of keys it contained.
# Make sure that writes are appended to the append only file correctly.
# The first CONFIG command enables the Append Only File. In order to do so Redis will block to generate the initial dump, then will open the file for writing, and will start appending all the next write queries.
# The second CONFIG command is used to turn off snapshotting persistence. This is optional, if you wish you can take both the persistence methods enabled.
# !IMPORTANT: remember to edit your redis.conf to turn on the AOF, otherwise when you restart the server the configuration changes will be lost and the server will start again with the old configuration.

# Performance
# Interactions between AOF and RDB persistence
# Redis >= 2.41 makes sure to avoid triggering an AOF rewrite when an RDB snapshotting operation is already in progress, or allowing a BGSAVE while the AOF rewrite is in progress. This prevents two Redis background processes from doing heavy disk I/O at the same time.
# When snapshotting is in progress and the user explicitly requests a log rewrite operation using BGREWRITEAOF the server will reply with an OK status code telling the user the operation is scheduled, and the rewrite will start once the snapshotting is completed.
# In the case both AOF and RDB persistence are enabled and Redis restarts the AOF file will be used to reconstruct the original dataset since it is guaranteed to be the most complete

# Backup
# Backing up Redis data
# Before starting this section, make sure to read the following sentence: Make Sure to Backup Your Database. Disks break, instances in the cloud disappear, and so forth: no backups means huge risk of data disappearing into /dev/null.
# Redis is very data backup friendly since you can copy RDB files while the database is running: the RDB is never modified once produced, and while it gets produced it uses a temporary name and is renamed into its final destination atomically using rename(2) only when the new snapshot is complete.
# This means that copying the RDB file is completely safe while the server is running. This is what we suggest:
# Create a cron job in your server creating hourly snapshots of the RDB file in one directory, and daily snapshots in a different directory.
# Every time the cron script runs, make sure to call the find command to make sure too old snapshots are deleted: for instance you can take hourly snapshots for the latest 48 hours, and daily snapshots for one or two months. Make sure to name the snapshots with data and time information.
# At least one time every day make sure to transfer an RDB snapshot outside your data center or at least outside the physical machine running your Redis instance.