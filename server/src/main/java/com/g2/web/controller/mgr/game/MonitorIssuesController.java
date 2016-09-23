package com.g2.web.controller.mgr.game;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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

import com.g2.entity.Server;
import com.g2.entity.User;
import com.g2.entity.game.MonitorGameConfig;
import com.g2.entity.game.MonitorIssues;
import com.g2.entity.game.MonitorIssuesReply;
import com.g2.service.account.AccountService;
import com.g2.service.account.ShiroDbRealm.ShiroUser;
import com.g2.service.game.MonitorIssuesService;
import com.g2.service.server.ServerService;
import com.g2.web.controller.mgr.BaseController;
import com.google.common.collect.Maps;

/**
 *  意见反馈管理的controller
 *
 */
@Controller("monitorIssuesController")
@RequestMapping(value="/manage/game/monitorIssues")
public class MonitorIssuesController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(MonitorIssuesController.class);
	
	private static final String PAGE_SIZE = "2";
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	Calendar calendar = new GregorianCalendar(); 

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

	static {
		sortTypes.put("auto", "编号");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}

	public static void setSortTypes(Map<String, String> sortTypes) {
		MonitorIssuesController.sortTypes = sortTypes;
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
	private ServerService serverService;
	
	@Autowired
	private MonitorIssuesService monitorIssuesService;
	
	/**
	 * @throws Exception 
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request) throws Exception{
		logger.debug("意见反馈");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = monitorIssuesService.getCurrentUserId();
		User user = accountService.getUser(userId);

		List<MonitorIssues> monitorIssues = new ArrayList<>();
		for (int i = 1; i <= 10; i++) {
			MonitorIssues m = new MonitorIssues();
			m.setId(Long.valueOf(i));
			m.setTime("2016-09-16");
			m.setServer("安卓"+i+"区");
			m.setUserId("user"+i);
			m.setName("玩家名称"+i);
			m.setGroup("战士"+i);
			m.setContact("188839384"+i);
			m.setDevice("iphone12312332a"+i);
			m.setText("超级好玩的游戏，大家来加我好友一起玩啊！！");
			monitorIssues.add(m);
		}
		
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		PageImpl<MonitorIssues> ps = new PageImpl<MonitorIssues>(monitorIssues, pageRequest, monitorIssues.size());
		
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		
		model.addAttribute("user", user);
		model.addAttribute("servers", serverService.findAll());
		model.addAttribute("monitorIssues", ps);
		
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/monitorissues/index";
	}
	
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public String edit(@RequestParam(value="id")long id,Model model){
		MonitorIssues issues = monitorIssuesService.findById(id);

		Long userId = monitorIssuesService.getCurrentUserId();
		User user = accountService.getUser(userId);
		model.addAttribute("servers", serverService.findAll());
		model.addAttribute("issues", issues);
		return "/game/monitorissues/add";
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public String update(MonitorIssuesReply monitorIssuesReply,ServletRequest request,RedirectAttributes redirectAttributes){
		//发送 monitorIssuesReply 给游戏服务器
		redirectAttributes.addFlashAttribute("message", "反馈消息成功");
		return "redirect:/manage/game/monitorIssues/index";
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
		 monitorIssuesService.delById(id);
		 map.put("success", "true");
		 return map;
	}
	
	/**
	 * 服务器获取时间
	 */
	@RequestMapping(value="/getDate")
	@ResponseBody
	public Map<String, String> getDate(){
		Map<String,String> dateMap = new HashMap<String, String>();
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
		Calendar calendar = new GregorianCalendar(); 
		String nowDate = sdf.format(new Date());
		
	    calendar.setTime(new Date()); 
	    calendar.add(Calendar.DATE,-1);
	    String yesterday = sdf.format(calendar.getTime());
	    
	    calendar.setTime(new Date()); 
	    calendar.add(Calendar.DATE,-7);
	    String sevenDayAgo = sdf.format(calendar.getTime()); 
	    
	    calendar.setTime(new Date()); 
	    calendar.add(Calendar.DATE,-30);
	    String thirtyDayAgo = sdf.format(calendar.getTime()); 
		
	    dateMap.put("nowDate",nowDate);
	    dateMap.put("yesterday",yesterday);
	    dateMap.put("sevenDayAgo",sevenDayAgo);
	    dateMap.put("thirtyDayAgo",thirtyDayAgo);
		return dateMap;
	}
	
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} 
		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}
	
}
