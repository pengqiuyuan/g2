package com.g2.service.game;

import java.util.Date;
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

import com.g2.entity.User;
import com.g2.entity.game.MonitorGameConfig;
import com.g2.repository.game.MonitorGameConfigDao;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;

@Component
@Transactional
public class MonitorGameConfigService {
	
	@Autowired
	private MonitorGameConfigDao monitorGameConfigDao;
	
	@Autowired
	private AccountService accountService;
	
	public List<MonitorGameConfig> findAll(){
		return monitorGameConfigDao.findAll();
	}
	
	public MonitorGameConfig findById(Long id){
		return monitorGameConfigDao.findOne(id);
	}
	
	public MonitorGameConfig findByConfigKey(String configKey){
		return monitorGameConfigDao.findByConfigKey(configKey);
	}

	public void save(MonitorGameConfig monitorGameConfig){
		monitorGameConfigDao.save(monitorGameConfig);
	}
	
	public void update(MonitorGameConfig monitorGameConfig){
		MonitorGameConfig m =  monitorGameConfigDao.findOne(monitorGameConfig.getId());
		m.setConfigKey(monitorGameConfig.getConfigKey());
		m.setConfigValue(monitorGameConfig.getConfigValue());
		m.setNodes(monitorGameConfig.getNodes());
		monitorGameConfigDao.save(m);
	}
	
	public void delById(Long id){
		monitorGameConfigDao.delete(id);
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
	public Page<MonitorGameConfig> findConfigByCondition(Long userId,
			Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		Specification<MonitorGameConfig> spec = buildSpecification(userId, searchParams);
		return monitorGameConfigDao.findAll(spec, pageRequest);
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
	private Specification<MonitorGameConfig> buildSpecification(Long userId,
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		User user = accountService.getUser(userId);
		Specification<MonitorGameConfig> spec = DynamicSpecifications.bySearchFilter(filters.values(), MonitorGameConfig.class);
		return spec;
	}
	
	public ShiroUser getCurrentUser() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
	
}
