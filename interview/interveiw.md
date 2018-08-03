# kafka
  
  ## FAQ 
     - 1
	  A:消息生产如何缩短提交到broker的时间？
	  Q: 生产采用无需broker确认的方式reqest.required.ack = 0
     - 2 
	  A:如何处理消息积压？
	  Q: 增加topic的partition个数
		 减少log.retention.hours时长
	 
# SpringBoot

  ## FAQ
	 - 1 
		A: How to start different profile with command parameter
		Q: java -jar *.jar --spring.profile.active=uat
	 - 2 
		A: SpringBean Conflict Solution
		Q: @ComponentScan(excludeFilter)
	 - 3
		A: Which Annotation enables a method or class to accept cross-origin requests
		Q: @CrossOrigin
	 - 4
	    A: @ConfigurationProperties(prefix="amazon")
		Q: application.properties
		   amazon.application=abc
     - 5
	    A: @ActiveProfiles annotion, which is especially useful when running test cases, as follows
        Q: @AvtiveProfiles("test")