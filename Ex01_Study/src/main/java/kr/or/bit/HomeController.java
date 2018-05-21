package kr.or.bit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.util.StatusPrinter;

/**
 * Handles requests for the application home page.
 */
public class HomeController {
	
	 public static void main( String[] args )
	    {
	    	// 로거 이용하기
	    	Logger logger = LoggerFactory.getLogger(HomeController.class);
	    	logger.debug("Hello debug");
	    	logger.trace("Hello trace");
	    	logger.info("Hello info");
	    	logger.warn("Hello warn");
	    	logger.error("Hello error");
	 
	        // 로거의 상태를 출력
	        LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory();
	        StatusPrinter.print(lc);
	    }
	
	
}
