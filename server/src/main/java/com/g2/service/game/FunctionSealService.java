package com.g2.service.game;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

import com.g2.entity.Server;
import com.g2.entity.User;
import com.g2.entity.game.FunctionSeal;
import com.g2.repository.game.FunctionSealDao;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class FunctionSealService {
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	
	Calendar calendar = new GregorianCalendar(); 
	
	@Autowired
	private FunctionSealDao functionSealDao;
	
	@Autowired
	private AccountService accountService;
	
	public String nowDate(){
		String nowDate = sdf.format(new Date());
		return nowDate;
	}
	
	public String EndDate(String sealDayCount){
		int a = Integer.valueOf(sealDayCount);
	    calendar.setTime(new Date()); 
	    calendar.add(Calendar.DATE,a);
	    Date date=calendar.getTime();
	    String da = sdf.format(date); 
		return da;
	}
	
	public List<FunctionSeal> findAll(){
		return functionSealDao.findAll();
	}
	
	public FunctionSeal findById(Long id){
		return functionSealDao.findOne(id);
	}
	
	public FunctionSeal findByUserId(String userId){
		return functionSealDao.findByUserId(userId);
	}

	/**
	 * 封号
	 * @param functionSeal
	 */
	public void save(FunctionSeal functionSeal){
		functionSealDao.save(functionSeal);
	}
	
	/**
	 * 解除封号
	 * @param functionSeal
	 */
	public void delById(Long id){
		functionSealDao.delete(id);
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
	public Page<FunctionSeal> findConfigByCondition(Long userId,
			Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		Specification<FunctionSeal> spec = buildSpecification(userId, searchParams);
		return functionSealDao.findAll(spec, pageRequest);
	}
	
	
	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("id".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		}
		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}
	
	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<FunctionSeal> buildSpecification(Long userId,
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		User user = accountService.getUser(userId);
		Specification<FunctionSeal> spec = DynamicSpecifications.bySearchFilter(filters.values(), FunctionSeal.class);
		return spec;
	}
	
	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
	
	
	
}
