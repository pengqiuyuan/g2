package com.g2;

import java.io.IOException;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.g2.util.SpringHttpClient;
import com.sun.el.parser.ParseException;


@ContextConfiguration(locations = {"/applicationContext.xml"})
public class TeTest extends SpringTransactionalTestCase{
	
	@Test
	public void test0() throws IOException, ParseException {	
		System.out.println("11111");
		System.out.println(new SpringHttpClient().getMethodStr("http://private-9394a-g22.apiary-mock.com/timeframe/newuser"));
	}
		
}
