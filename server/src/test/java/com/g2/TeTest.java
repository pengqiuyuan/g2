package com.g2;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.type.TypeReference;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.g2.entity.game.ConfigServer;
import com.g2.util.JsonBinder;
import com.g2.util.SpringHttpClient;
import com.sun.el.parser.ParseException;


@ContextConfiguration(locations = {"/applicationContext.xml"})
public class TeTest extends SpringTransactionalTestCase{
	
	@Value("#{envProps.server_url}")
	private String excelUrl;
	
	private static JsonBinder binder = JsonBinder.buildNonDefaultBinder();
	
	@Test
	public void test0() throws IOException, ParseException {	
		System.out.println("11111");
		//System.out.println(new SpringHttpClient().getMethodStr("http://private-9394a-g22.apiary-mock.com/timeframe/newuser"));
		System.out.println(new SpringHttpClient().getMethodStr(excelUrl));
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		for (ConfigServer configServer : beanList) {
			System.out.println("2222  "  + configServer.getServerName());
		}
	}
		
}
