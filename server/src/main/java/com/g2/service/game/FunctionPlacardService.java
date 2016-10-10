package com.g2.service.game;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.g2.entity.game.FunctionPlacard;
import com.g2.repository.game.FunctionPlacardDao;
import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class FunctionPlacardService {
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	
	Calendar calendar = new GregorianCalendar(); 
	
	@Autowired
	private FunctionPlacardDao functionPlacardDao;
	
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
	
	public FunctionPlacard findById(long id){
		FunctionPlacard functionPlacard = new FunctionPlacard();
		functionPlacard.setTitle("我是要修改的title");
		functionPlacard.setText("我是要修改的text");
		return functionPlacard;
	}
	
	public void save(FunctionPlacard functionPlacard){
		functionPlacardDao.save(functionPlacard);
	}
	
}
