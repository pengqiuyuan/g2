package com.g2.service.game;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.g2.entity.User;
import com.g2.entity.game.FunctionGiftCode;
import com.g2.repository.game.FunctionGiftCodeDao;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class FunctionGiftCodeService {
	
	@Autowired
	private FunctionGiftCodeDao functionGiftCodeDao;
	
	@Autowired
	private AccountService accountService;
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	
	SimpleDateFormat sdfString =   new SimpleDateFormat("yyyyMMddHHmmss" ); 
	
	Calendar calendar = new GregorianCalendar(); 
	
	public String nowDateString(){
		String nowDate = sdfString.format(new Date());
		return nowDate;
	}
	
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
	
	
	public void save(FunctionGiftCode functionGiftCode){
		functionGiftCodeDao.save(functionGiftCode);
	}
	
	/**
	 * 分页查询
	 * 
	 * @param userId
	 * @param searchParams
	 * @param pageNumber
	 * @param pageSize
	 * @param sortType
	 * @return
	 */
	public Page<FunctionGiftCode> findConfigByCondition(Long userId,
			Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		Specification<FunctionGiftCode> spec = buildSpecification(userId, searchParams);
		return functionGiftCodeDao.findAll(spec, pageRequest);
	}
	
	
	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.ASC, "id");
		}else  if ("id".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		}else if ("giftNum".equals(sortType)) {
			sort = new Sort(Direction.DESC, "giftNum");
		}
		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}
	
	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<FunctionGiftCode> buildSpecification(Long userId,
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		User user = accountService.getUser(userId);
		Specification<FunctionGiftCode> spec = DynamicSpecifications.bySearchFilter(filters.values(), FunctionGiftCode.class);
		return spec;
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
