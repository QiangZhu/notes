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
