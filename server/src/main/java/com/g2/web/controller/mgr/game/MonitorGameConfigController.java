package com.g2.web.controller.mgr.game;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.g2.entity.Log;
import com.g2.entity.User;
import com.g2.entity.game.MonitorGameConfig;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;
import com.g2.service.game.MonitorGameConfigService;
import com.g2.service.log.LogService;
import com.g2.util.JsonBinder;
import com.g2.web.controller.mgr.BaseController;
import com.google.common.collect.Maps;

@Controller("monitorGameConfigController")
@RequestMapping(value="/manage/game/monitorGameConfig")
public class MonitorGameConfigController extends BaseController{

	private static final String PAGE_SIZE = "50";
	
	private static final Logger logger = LoggerFactory.getLogger(MonitorGameConfigController.class);
	
	private static Map<String,String> sortTypes = Maps.newLinkedHashMap();
	
	static{
		sortTypes.put("auto","自动");
		sortTypes.put("id", "Id");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}
	
	public static void setSortTypes(Map<String, String> sortTypes) {
		MonitorGameConfigController.sortTypes = sortTypes;
	}
	
	@Autowired
	private MonitorGameConfigService monitorGameConfigService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private LogService logService;
	
	@Value("#{envProps.server_url}")
	private String excelUrl;
	
	private static JsonBinder binder = JsonBinder.buildNonDefaultBinder();
	
	@RequestMapping(value = "index",method=RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request){
		Long userId = getCurrentUserId();
		ShiroUser user = getCurrentUser();
		User u = accountService.getUser(user.id);
		logger.info("userId"+userId+"游戏配置设置");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<MonitorGameConfig> monitorGameConfigs = monitorGameConfigService.findConfigByCondition(userId,searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("monitorGameConfigs", monitorGameConfigs);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		
		logService.log(getCurrentUser().getName(), getCurrentUser().getName() + "：访问游戏配置页面", Log.TYPE_MONITOR_GAMECONFIG);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/monitorgameconfig/index";
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value = "/add" ,method=RequestMethod.GET)
	public String add(Model model){
		ShiroUser user = getCurrentUser();
		User u = accountService.getUser(user.id);
		return "/game/monitorgameconfig/add";
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value = "/save",method=RequestMethod.POST)
	public String save(MonitorGameConfig monitorGameConfig,ServletRequest request,RedirectAttributes redirectAttributes,Model model){
		monitorGameConfigService.save(monitorGameConfig);
		logService.log(getCurrentUser().getName(), getCurrentUser().getName() + "：新增游戏配置", Log.TYPE_MONITOR_GAMECONFIG);
		redirectAttributes.addFlashAttribute("message", "新增成功");
		return "redirect:/manage/game/monitorGameConfig/index";
	}
	
	
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public String edit(@RequestParam(value="id")long id,Model model){
		MonitorGameConfig monitorGameConfig = monitorGameConfigService.findById(id);
		
		logService.log(getCurrentUser().getName(), getCurrentUser().getName() + "：修改游戏配置", Log.TYPE_MONITOR_GAMECONFIG);
		model.addAttribute("monitorGameConfig", monitorGameConfig);
		return "/game/monitorgameconfig/edit";
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public String update(MonitorGameConfig monitorGameConfig,ServletRequest request,RedirectAttributes redirectAttributes){
		monitorGameConfigService.update(monitorGameConfig);
		redirectAttributes.addFlashAttribute("message", "更新成功");
		return "redirect:/manage/game/monitorGameConfig/index";
	}
	
	/**
	 * 删除操作	 
	 * @param oid 用户id
	 * @throws Exception 
	 */
	@RequestMapping(value = "del", method = RequestMethod.DELETE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public Map<String,Object> delServerZone(@RequestParam(value = "id")Long id) throws Exception{
		 Map<String,Object> map = new HashMap<String, Object>();
		 monitorGameConfigService.delById(id);
		 map.put("success", "true");
		 return map;
	}
	
	@RequestMapping(value = "/checkConfigKey")
	@ResponseBody
	public String checkConfigKey(@RequestParam("configKey") String configKey) {
		if (monitorGameConfigService.findByConfigKey(configKey) == null) {
			return "true";
		} else {
			return "false";
		}
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
