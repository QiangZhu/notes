# native2ascii
# https://docs.oracle.com/javase/7/docs/technotes/tools/windows/native2ascii.html
native2ascii c:\source.txt c:\output.txt
native2ascii -encoding utf8 c:\source.txt c:\output.txt

# java.nio.charset.Charset.defaultCharset

# java remote debug
java -agentlib:jdwp=transport=dt_socket,server=y,address=8000,suspend=n <other arguments>

# Java Linux Enviroment Configuration
JAVA_HOME=/usr/java/jdk1.8.0_92 ; export JAVA_HOME
GEMFIRE=/opt/GemFire9.1.0 ; export GEMFIRE
PATH=$PATH;$GEMFIRE/bin; export PATH
CLASSPATH=$GEMFILE/lib/geode-dependencies.jar ; export CLASSPATH

# Java Window Enviroment Configuration
set JAVA_HOME=c:\Program Files\Java\jdk1.8.2_92
set GEMFIRE=c:\GemFire9.1.0
set PATH=%PATH%;$GEMFIRE$\bin
set CLASSPATH=%CLASSPTH%\lib\geode-dependencies.jar


#start.sh
#!/bin/bash
SERVER_NAME=msgCenter.jar
PIDS=`ps -f | grep java | grep $SERVER_NAME |awk '{print $2}'`
if [ -z "$PIDS" ]; then
    echo "ERROR: The $SERVER_NAME does not started!"
    exit 0
fi

echo -e "Stopping the $SERVER_NAME ...\c"
for PID in $PIDS ; do
    kill $PID > /dev/null 2>&1
done

COUNT=0
while [ $COUNT -lt 1 ]; do
    echo -e ".\c"
    sleep 1
    COUNT=1
    for PID in $PIDS ; do
        PID_EXIST=`ps -f -p $PID | grep java`
        if [ -n "$PID_EXIST" ]; then
            COUNT=0
            break
        fi
    done
done

echo "OK!"
echo "PID: $PIDS"

#stop.sh
#!/bin/bash
cd `dirname $0`
DEPLOY_DIR=`pwd`
SERVER_NAME=msgCenter.jar

PIDS=`ps -f | grep java | grep $SERVER_NAME |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: The $SERVER_NAME already started!"
    echo "PID: $PIDS"
    exit 1
fi

JAVA_MEM_OPTS=""
BITS=`java -version 2>&1 | grep -i 64-bit`
if [ -n "$BITS" ]; then
    JAVA_MEM_OPTS=" -jar " #-Ddubbo.spring.config=classpath:META-INF/spring/sys-root.xml -Ddubbo.shutdown.hook=true" #-Xmx2g -Xms2g -Xmn256m -XX:PermSize=128m -Xss256k -XX:+DisableExplicitGC -XX:+UseConcMarkSwe
epGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:LargePageSizeInBytes=128m -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 "
else
    JAVA_MEM_OPTS=" -jar " #-Ddubbo.spring.config=classpath:META-INF/spring/sys-root.xml -Ddubbo.shutdown.hook=true" #-Xms1g -Xmx1g -XX:PermSize=128m -XX:SurvivorRatio=2 -XX:+UseParallelGC "
fi

echo -e "Starting the $SERVER_NAME ...\c"
nohup java $JAVA_MEM_OPTS $SERVER_NAME >/dev/null 2>&1 &
echo "OK!"
PIDS=`ps -f | grep java | grep "$SERVER_NAME" | awk '{print $2}'`
echo "PID: $PIDS"


org.apache.tomcat.jdbc.pool.ConnectionPool
/**
     * Convert an exception into a String
     * @param x - the throwable
     * @return a string representing the stack trace
     */
    public static String getStackTrace(Throwable x) {
        if (x == null) {
            return null;
        } else {
            java.io.ByteArrayOutputStream bout = new java.io.ByteArrayOutputStream();
            java.io.PrintStream writer = new java.io.PrintStream(bout);
            x.printStackTrace(writer);
            String result = bout.toString();
            return (x.getMessage()!=null && x.getMessage().length()>0)? x.getMessage()+";"+result:result;
        } //end if
    }
