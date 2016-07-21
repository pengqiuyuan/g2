package com.g2.web.controller.mgr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.web.Servlets;

import com.g2.entity.Server;
import com.g2.entity.Stores;
import com.g2.entity.User;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;
import com.g2.service.platForm.PlatFormService;
import com.g2.service.server.ServerService;
import com.g2.service.serverZone.ServerZoneService;
import com.g2.service.store.StoreService;
import com.google.common.collect.Maps;

/**
 * 概括管理的controller
 *
 */
@Controller("summaryController")
@RequestMapping(value="/manage/game/summary")
public class SummaryController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(SummaryController.class);
	
	private static final String PAGE_SIZE = "15";
	

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("createDate", "时间");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}

	public static void setSortTypes(Map<String, String> sortTypes) {
		SummaryController.sortTypes = sortTypes;
	}


	
	@Override
	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder){
		binder.registerCustomEditor(Date.class,"createDate",new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.registerCustomEditor(Date.class,"upDate",new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
	
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ServerZoneService serverZoneService;

	@Autowired
	private PlatFormService platFormService;
	
	@Autowired
	private ServerService serverService;
	
	/**
	 *  门店管理首页
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request){
		Long userId = getCurrentUserId();
		User u = accountService.getUser(userId);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		if (!u.getRoles().equals(User.USER_ROLE_ADMIN)) {
			List<Stores> stores = new ArrayList<Stores>();
			Stores sto=  storeService.findById(Long.valueOf(u.getStoreId()));
			stores.add(sto);
			model.addAttribute("stores", stores);
		}else{
			List<Stores> stores =  storeService.findList();
			model.addAttribute("stores", stores);
		}
		model.addAttribute("serverZones", serverZoneService.findAll());
		model.addAttribute("platForms", platFormService.findAll());
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/summary/index";
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
	
	@RequestMapping(value = "/findServerByStoreId")
	@ResponseBody
	public Set<Server> findServerByStoreId(@RequestParam(value="storeId")String storeId){
		System.out.println("11111");
		Set<Server> servers = serverService.findByStoreId(storeId);
		return servers;
	}
	
}
