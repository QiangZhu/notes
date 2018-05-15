java -jar -Dserver.port=8080 your.jar
java -jar -Dspring.jpa.hibernate.ddl-auto=none msgCenter.jar

reference
1.[https://stackoverflow.com/questions/21083170/spring-boot-how-to-configure-port]


spring cache
#applicaiton.properties
spring.cache.type=redis
#SpringApplicaiton.run() class 
@EnableCaching
使用场景
@Transactional
	@CacheEvict(value = "YxMessageExtTemplateDefinitionDto", key = "#dto.code")
	@Override
	public YxMessageExtTemplateDefinitionDto delete(YxMessageExtTemplateDefinitionDto dto) {
		
	}

@Transactional
	@CachePut(value = "YxMessageExtTemplateDefinitionDto", key = "#dto.code")
	@Override
	public YxMessageExtTemplateDefinitionDto update(YxMessageExtTemplateDefinitionDto dto) {
		
	}
	
@Cacheable(value = "YxMessageExtTemplateDefinitionDto", key = "#dto.code")
	@Override
	public YxMessageExtTemplateDefinitionDto findByCode(YxMessageExtTemplateDefinitionDto dto) {
		
	}

@CacheEvict(value = "YxMessageExtTemplateDefinitionDto", allEntries = true)
	@Override
	public void clearCache() {
		log.info("successed to evcit cache");
	}
	
	
# Springboot中的application.properties中的配置引用Maven pom.xml中的值
  
# pom.xml
  <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.yixin</groupId>
	<artifactId>msgCenter</artifactId>
	<version>1.4.1</version>
	<packaging>jar</packaging>
	<url>http://maven.apache.org</url>

	<name>msgCenter</name>
	<description>Demo project for Spring Boot</description>
	
# application.properties
  info.app.name=@project.name@
  info.app.description=@project.description@
  info.app.version=@project.version@
