
Jenkins

Jenkins-Vue部署
#npm install -g cnpm --registry=https://registry.npm.taobao.org
cd /data1/.jenkins/workspace/nusc-vue/src
#/usr/local/nodejs/bin/cnpm install ztree
/usr/local/nodejs/bin/node build/build.js
ssh app@192.168.145.33 "rm -rf /data1/web-static/nusc-web/nusc-vue/*"
scp -r /data1/.jenkins/workspace/nusc-vue/src/dist/* app@192.168.145.33:/data1/web-static/nusc-web/nusc-vue/

Jenkins-Java部署
#备份dubbo jar包
#ssh -p 51000  app@10.0.5.154 "cp /data1/d_info/messageCenter/msgCenter.jar /data1/d_info/messageCenter/bak/msgCenter.jar.$$"
ssh -p 51000  app@10.0.5.155 "cp /data1/d_info/messageCenter/msgCenter.jar /data1/d_info/messageCenter/bak/msgCenter.jar.$$"

#copy新的dubbo jar包到目标服务器
#scp  -P 51000 /data1/.jenkins/workspace/messageCenter/target/msgCenter-1.1.2.jar app@10.0.5.154:/data1/d_info/messageCenter/msgCenter.jar
scp  -P 51000 /data1/.jenkins/workspace/messageCenter/target/msgCenter-1.1.2.jar app@10.0.5.155:/data1/d_info/messageCenter/msgCenter.jar

#停止/启动dubbo服务
#ssh -p 51000 app@10.0.5.154 "sh /data1/d_info/messageCenter/stop.sh"
#ssh -p 51000 app@10.0.5.154 "sh /data1/d_info/messageCenter/start.sh"

ssh -p 51000 app@10.0.5.155 "sh /data1/d_info/messageCenter/stop.sh"
ssh -p 51000 app@10.0.5.155 "sh /data1/d_info/messageCenter/start.sh"
