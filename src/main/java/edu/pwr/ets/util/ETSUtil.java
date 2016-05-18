package edu.pwr.ets.util;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class ETSUtil {
	
	static Logger logger=Logger.getLogger(ETSUtil.class.getName());
	
	private static final String[] configFiles = { "/edu/pwr/ets/util/datasource.xml"};
	private static ApplicationContext ctx = null;
	
	public static DriverManagerDataSource getDataSource() {
		DriverManagerDataSource	basicDataSource =	(DriverManagerDataSource) getAppContext().getBean("dataSource");
		return basicDataSource;
	}
	
	public static ApplicationContext getAppContext() {
		if (ctx == null) {
			try {
				ctx = new ClassPathXmlApplicationContext(configFiles);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return ctx;
	}
	

}
