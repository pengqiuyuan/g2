package com.g2.web.controller.mgr.game;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.g2.entity.Log;
import com.g2.entity.User;
import com.g2.entity.game.ConfigServer;
import com.g2.entity.game.MonitorIssues;
import com.g2.entity.game.MonitorIssuesReply;
import com.g2.service.account.AccountService;
import com.g2.service.game.MonitorIssuesService;
import com.g2.service.log.LogService;
import com.g2.util.HttpClientUts;
import com.g2.util.JsonBinder;
import com.g2.util.SpringHttpClient;
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
	
	private static final String PAGE_SIZE = "15";
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	Calendar calendar = new GregorianCalendar(); 

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

	static {
		sortTypes.put("auto", "编号");
		sortTypes.put("time", "时间");
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
	private MonitorIssuesService monitorIssuesService;
	
	@Autowired
	private LogService logService;
	
	@Value("#{envProps.server_url}")
	private String excelUrl;
	
	private static JsonBinder binder = JsonBinder.buildNonDefaultBinder();
	
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
		
		Page<MonitorIssues> monitorIssues = monitorIssuesService.findConfigByCondition(userId,searchParams, pageNumber, pageSize, sortType);
		
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("user", user);
		model.addAttribute("monitorIssues", monitorIssues);
		//model.addAttribute("servers", serverService.findAll());
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		model.addAttribute("servers", beanList);
		
		logService.log(monitorIssuesService.getCurrentUser().getName(), monitorIssuesService.getCurrentUser().getName() + "：访问意见反馈页面", Log.TYPE_MONITOR_ISSUES);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/monitorissues/index";
	}
	
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public String edit(@RequestParam(value="id")long id,
			@RequestParam(value="server")String server,
			@RequestParam(value="name")String name,
			@RequestParam(value="userId")String userId,
			Model model) throws JsonParseException, JsonMappingException, IOException{
		MonitorIssues issues = new MonitorIssues();
		issues.setId(id);
		issues.setServer(server);
		issues.setName(name);
		issues.setUserId(userId);
		
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		model.addAttribute("servers", beanList);
		
		model.addAttribute("issues", issues);
		return "/game/monitorissues/add";
	}
	
	/**
	 * 反馈信息回复
	 * @throws Exception 
	 */
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public String update(MonitorIssuesReply monitorIssuesReply,ServletRequest request,RedirectAttributes redirectAttributes) throws Exception{
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		//发送 monitorIssuesReply 给游戏服务器
		Boolean tag = false;
		for (ConfigServer configServer : beanList) {
			if(configServer.getServerName().equals(monitorIssuesReply.getServer())){
				String result = HttpClientUts.doGet("http://"+configServer.getIp()+":"+configServer.getPort()+"/api/sendIssuesReply"+"?server="+URLEncoder.encode(monitorIssuesReply.getServer(), "utf-8")+"&userId="+URLEncoder.encode(monitorIssuesReply.getUserId(), "utf-8")+"&title="+URLEncoder.encode(monitorIssuesReply.getTitle(), "utf-8")+"&text="+URLEncoder.encode(monitorIssuesReply.getText(), "utf-8"), "utf-8");
				JSONObject dataJson=JSONObject.fromObject(result);
				if(dataJson.get("result").equals("1")){
					redirectAttributes.addFlashAttribute("message", "反馈消息发送成功");
				}else{
					redirectAttributes.addFlashAttribute("message", "反馈消息发送失败");
				}
				tag = true;
			}
		}
		if (!tag){
			redirectAttributes.addFlashAttribute("message", "未发现 "+monitorIssuesReply.getServer()+" 服务器，反馈消息发送失败");
		}
		logService.log(monitorIssuesService.getCurrentUser().getName(), monitorIssuesService.getCurrentUser().getName() + "：发送意见反馈", Log.TYPE_MONITOR_ISSUES);
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
		 logService.log(monitorIssuesService.getCurrentUser().getName(), monitorIssuesService.getCurrentUser().getName() + "：删除意见反馈", Log.TYPE_MONITOR_ISSUES);
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
	
}
