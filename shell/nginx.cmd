#/usr/local/nginx/sbin
$ ./nginx -s reload

# version
$ ./nginx -v

cd /usr/local
wget  http://nginx.org/download/nginx-1.9.0.tar.gz
tar -zxvf nginx-1.9.0.tar.gz
cd nginx-1.9.0
./configure && make && make install
./configure --prefix=/usr/local/nginx --with-http_ssl_module &&make &&make install

cd /usr/local/src
wget https://www.openssl.org/source/openssl-1.0.1t.tar.gz
tar -zxvf openssl-1.0.1t.tar.gz
./config --prefix=/usr/local/openssl && make && make install 

#创建服务器私钥
openssl genrsa -des3 -out server.key 1024
#创建签名请求的证书（CSR）
openssl req -new -key server.key -out server.csr
#加载SSL支持的Nginx并使用私钥时去除口令：
cp server.key server.key.bak
openssl rsa -in server.key.bak -out server.key
#自动签发证书：
openssl x509 -req -days 10240 -in server.csr -signkey server.key -out server.crt

#
cp server.crt /nginx/conf/
cp server.key /ninx/conf/

