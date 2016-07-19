package com.g2.web.controller.mgr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.g2.entity.Function;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;
import com.g2.service.function.FunctionService;
import com.google.common.collect.Maps;

/**
 * 定义功能权限的controller
 *
 */
@Controller("functionController")
@RequestMapping(value="/manage/functions")
public class FunctionController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(FunctionController.class);
	
	private static final String PAGE_SIZE = "15";
	

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

	private static List<String> firstNa = new ArrayList<String>();
	
	static {
		firstNa.add("系统管理");
		firstNa.add("概况");
		firstNa.add("玩家");
		firstNa.add("在线分析");
		firstNa.add("等级分析");
		firstNa.add("任务分析");
		firstNa.add("收入分析");
		firstNa.add("虚拟消费");
		firstNa.add("鲸鱼用户");
	}
	
	static {
		sortTypes.put("auto", "自动");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}

	public static void setSortTypes(Map<String, String> sortTypes) {
		FunctionController.sortTypes = sortTypes;
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
	private FunctionService functionService;

	
	/**
	 *  功能权限管理首页
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request){
		Long storeId = getCurrentStoresId();
		logger.info("storeId"+storeId+"定义功能权限");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Page<Function> function = functionService.findStoresByCondition(storeId,searchParams, pageNumber, pageSize, sortType);
		model.addAttribute("function", function);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("firstNa", firstNa);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/functions/index";
	}
	
	
	/**
	 * 操作员编辑页@param oid 用户ID
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id")long id,Model model){
		Function function = functionService.findById(id);
		model.addAttribute("function", function);
		model.addAttribute("id", id);
		return "/functions/edit";
	}
	
	/**
	 * 操作员更新页
	 * 	 * @param store 用户
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateFunction(Function function,RedirectAttributes redirectAttributes){
		functionService.update(function);
		redirectAttributes.addFlashAttribute("message", "修改功能权限成功");
	    return "redirect:/manage/functions/index";
	}
	
	/**
	 * 新增操作员页@param uid 租户ID
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addFunction(Model model){
		model.addAttribute("firstNa", firstNa);
		return "/functions/add";
	}
	
	/**
	 * 新增操作@param Storestest 用户
	 * @return
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String saveFunction(Function function,RedirectAttributes redirectAttributes){
		functionService.save(function);
		redirectAttributes.addFlashAttribute("message", "新增功能权限成功");
		return "redirect:/manage/functions/index";
	}
	/**
	 * 删除操作 @param oid 用户id
	 * @throws Exception 
	 */
	@RequestMapping(value = "del", method = RequestMethod.DELETE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public Map<String,Object> delFunction(@RequestParam(value = "id")long id) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		functionService.delById(id);
		map.put("success", "true");
		return map;
	}
	
	/**
	 * 详细
	 * @param id 用户id
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String show(@RequestParam(value = "id")long id,Model model){
		Function function = functionService.findById(id);
		model.addAttribute("function", function);
		return "/functions/info";
	}
	
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	public Long getCurrentStoresId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
	
	public String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.name;
	}
	
	/**
	 * Ajax请求校验name是否唯一。
	 */
	@RequestMapping(value = "checkSecondName")
	@ResponseBody
	public String checkSecondName(@RequestParam("secondName") String secondName) {
		if (functionService.findBySecondName(secondName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
	
	/**
	 * Ajax请求校验role是否唯一。
	 */
	@RequestMapping(value = "checkRole")
	@ResponseBody
	public String checkRole(@RequestParam("role") String role) {
		if (functionService.findByRole(role) == null) {
			return "true";
		} else {
			return "false";
		}
	}

	public static List<String> getFirstNa() {
		return firstNa;
	}

}
