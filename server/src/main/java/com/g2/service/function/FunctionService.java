package com.g2.service.function;

import java.util.Map;
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
import org.springside.modules.persistence.SearchFilter.Operator;

import com.g2.entity.Function;
import com.g2.entity.User;
import com.g2.repository.FunctionDao;
import com.g2.repository.UserDao;
import com.g2.service.account.AccountService;

@Component
@Transactional
/**
 * @Description 功能权限Service
 * @author Administrator
 *
 */
public class FunctionService {

	@Autowired
	private FunctionDao functionDao;
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private UserDao userDao;

	/**
	 * 通过ID查询
	 * 
	 * @param id
	 * @return
	 */
	public Function findById(long id) {
		return functionDao.findOne(id);
	}
	
	public void delById(long id){
		functionDao.delete(id);
	}

	public Function findByName(String name){
		return functionDao.findByName(name);
	}
	
	public Function findByRole(String role){
		return functionDao.findByRole(role);
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
	public Page<Function> findStoresByCondition(Long userId,
			Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		Specification<Function> spec = buildSpecification(userId, searchParams);
		return functionDao.findAll(spec, pageRequest);
	}


	/**
	 * 新增
	 * 
	 * @param function
	 */
	public void save(Function function) {
		function.setStatus(Function.STATUS_VALIDE);
		functionDao.save(function);
	}

	/**
	 * 修改
	 * 
	 * @param function
	 */
	public void update(Function function) {
		Function func = functionDao.findOne(function.getId());
		func.setName(function.getName());
		func.setRole(function.getRole());
		func.setStatus(function.getStatus());
		functionDao.save(func);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		}
		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<Function> buildSpecification(Long userId,
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		User user = accountService.getUser(userId);
		Specification<Function> spec = DynamicSpecifications.bySearchFilter(filters.values(), Function.class);
		return spec;
	}

}
