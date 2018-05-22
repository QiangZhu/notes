# Security Issue List
	- CSRF
	- Session Fixation protection
	
# HTTP Security
## HTTP HEADER
	- HTTP Strict Transport Security for secure requests
	- X-Content-Type-Options
	- Cache
	- X-XSS-Protection
	- X-Frame-Options integration to help prevent Clickjacking (iframe被默认禁止使用)
	
# OAuth
## RFC6749
## 是解决私人用户存储在服务供应商上的信息如何授权让第三方应用使用
	- Resource Owner 资源的拥有者
	- User Agent     与资源交互的平台
	- HTTP Service   提供访问资源的服务
	- Authorization Server 对资源访问认证服务
	- Resource Server 资源服务器
	- Third-party Application 需要访问私人资源的第三方应用
## 关键流程
	（A）用户(Resource Owner)打开客户端(Third-party Application)以后，客户端通过代理(User Agent)要求用户给予授权。
	（B）用户同意给予客户端授权。
	（C）客户端使用上一步获得的授权，向认证服务器(Authorization Server)申请令牌。
	（D）认证服务器对客户端进行认证以后，确认无误，同意发放令牌。
	（E）客户端使用令牌，向资源服务器(Resource Server)申请获取资源。
	（F）资源服务器确认令牌无误，同意向客户端开放资源。
	
# Reference
1. [Spring Security(三)--核心配置解读](https://www.iocoder.cn/Spring-Security/good-collection/)
2. [理解OAuth2.0](http://www.ruanyifeng.com/blog/2014/05/oauth_2_0.html)
	