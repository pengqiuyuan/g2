package com.g2.service.count;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.SearchFilter;

import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class SummaryService {
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	
	Calendar calendar = new GregorianCalendar(); 
	
	public Map<String, Object> findSummaryByCondition(Map<String, Object> searchParams){
		
		for(Map.Entry<String, Object> entry : searchParams.entrySet()){
			System.out.println("tttt   " + entry.getKey() + "    "  + entry.getValue());
		}
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		System.out.println("1111212  "  + filters.values());
		return null;
	}
	
	public String nowDate(){
		String nowDate = sdf.format(new Date());
		return nowDate;
	}
	
	public String thirtyDayAgoFrom(){
	    calendar.setTime(new Date()); 
	    calendar.add(calendar.DATE,-30);
	    Date date=calendar.getTime();
	    String da = sdf.format(date); 
		return da;
	}
	
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	public Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
	
	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
}
