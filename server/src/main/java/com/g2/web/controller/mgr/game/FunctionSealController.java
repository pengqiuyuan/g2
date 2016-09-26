package com.g2.web.controller.mgr.game;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.g2.entity.User;
import com.g2.entity.game.FunctionSeal;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;
import com.g2.service.game.FunctionSealService;
import com.g2.service.server.ServerService;
import com.g2.web.controller.mgr.BaseController;
import com.google.common.collect.Maps;

@Controller("functionSealController")
@RequestMapping(value="/manage/game/functionSeal")
public class FunctionSealController extends BaseController{

	private static final String PAGE_SIZE = "50";
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionSealController.class);
	
	private static Map<String,String> sortTypes = Maps.newLinkedHashMap();
	
	static{
		sortTypes.put("auto","自动");
		sortTypes.put("id", "Id");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}
	
	public static void setSortTypes(Map<String, String> sortTypes) {
		FunctionSealController.sortTypes = sortTypes;
	}
	
	@Autowired
	private FunctionSealService functionSealService;
	
	@Autowired
	private ServerService serverService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = "index",method=RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request){
		Long userId = getCurrentUserId();
		ShiroUser user = getCurrentUser();
		User u = accountService.getUser(user.id);
		logger.info("userId"+userId+"黑名单管理");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<FunctionSeal> functionSeals = functionSealService.findConfigByCondition(userId,searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("functionSeals", functionSeals);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("servers", serverService.findAllNot());
		// 将搜索条件编码成字符串，用于排序，分页的URL
		
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/functionseal/index";
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value = "/add" ,method=RequestMethod.GET)
	public String add(Model model){
		ShiroUser user = getCurrentUser();
		User u = accountService.getUser(user.id);
		model.addAttribute("servers", serverService.findAllNot());
		return "/game/functionseal/add";
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value = "/save",method=RequestMethod.POST)
	public String save(FunctionSeal functionSeal,ServletRequest request,RedirectAttributes redirectAttributes,Model model){
		functionSeal.setSealStart(functionSealService.nowDate());
		functionSeal.setSealEnd(functionSealService.EndDate(functionSeal.getSealDayCount()));
		functionSealService.save(functionSeal);
		redirectAttributes.addFlashAttribute("message", "新增封禁账号成功");
		return "redirect:/manage/game/functionSeal/index";
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
		 functionSealService.delById(id);
		 map.put("success", "true");
		 return map;
	}
	
	@RequestMapping(value = "/findUserName")
	@ResponseBody
	public String findUserName(@RequestParam("userId") String userId) {
		//查询 mongodb 找到 userId 对应的 userName
		return "战胜无双2";
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
