# archetype
mvn archetype:create-from-project
cd target/genterated-sources/archetype/
mvn install or mvn deploy
mvn archetype:generate 
-DarchetypeGroupId=com.keevol.springboot.chapter5
-DarchetypeArtifactId=currency-webapi-with-scala-archetype
-DarchetypeVersion=0.0.1-SNAPSHOT
-DgroupId=com.keevol.springboot
-DartifactId=new-scala-project-name
-Dversion=0.0.1-SNAPSHOT


# jar
<build>
		<sourceDirectory>src</sourceDirectory>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.7.0</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
					<encoding>UTF-8</encoding>
				</configuration>
			</plugin>
			<plugin>
				<artifactId>maven-jar-plugin</artifactId>
				<configuration>
					<archive>
						<manifest>
							<addClasspath>true</addClasspath>
							<mainClass>test.TestMain</mainClass>
						</manifest>
					</archive>
				</configuration>
			</plugin>
		</plugins>
	</build>
    
 # install jar to local repository
 
   ```
   mvn install:install-file -Dfile=C:\Users\tony\git\github\fineract-cn-lang\build\libs\lang-0.1.0-BUILD-SNAPSHOT.jar -DgroupId=org.apache.fineract.cn -DartifactId=lang -Dversion=0.1.0-BUILD-SNAPSHOT -Dpackaging=jar
   ```