package com.g2.service.game;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.g2.entity.game.MonitorIssues;
import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class MonitorIssuesService {
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	
	Calendar calendar = new GregorianCalendar(); 
	
	public String nowDate(){
		String nowDate = sdf.format(new Date());
		return nowDate;
	}
	
	public String thirtyDayAgoFrom(){
	    calendar.setTime(new Date()); 
	    calendar.add(Calendar.DATE,-30);
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
	
	public MonitorIssues findById(long id){
		MonitorIssues m =  new MonitorIssues();
		m.setServer("安卓1区");
		m.setName("若风");
		return m;
	}
	
	public void delById(long id){
		//向游戏服务发送删除反馈的请求
	}
}
