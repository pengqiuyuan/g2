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

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
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
import com.g2.entity.game.FunctionPlacard;
import com.g2.service.account.AccountService;
import com.g2.service.game.DataBasicService;
import com.g2.service.game.DataPayPointService;
import com.g2.service.game.FunctionPlacardService;
import com.g2.service.log.LogService;
import com.g2.service.server.ServerService;
import com.g2.web.controller.mgr.BaseController;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Maps;

/**
 *  登录公告管理的controller
 *
 */
@Controller("functionPlacardController")
@RequestMapping(value="/manage/game/functionPlacard")
public class FunctionPlacardController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(FunctionPlacardController.class);
	
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
		FunctionPlacardController.sortTypes = sortTypes;
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
	private FunctionPlacardService functionPlacardService;
	
	/**
	 * @throws Exception 
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto")String sortType, Model model,
			ServletRequest request) throws Exception{
		logger.debug("登录公告");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = functionPlacardService.getCurrentUserId();
		User user = accountService.getUser(userId);

		List<FunctionPlacard> functionPlacards = new ArrayList<>();
		for (int i = 1; i <= 10; i++) {
			FunctionPlacard f = new FunctionPlacard();
			f.setId(i);
			f.setCrDate(new Date());
			f.setTitle("test " +i);
			f.setText("啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦 " +i);
			functionPlacards.add(f);
		}
		
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		PageImpl<FunctionPlacard> ps = new PageImpl<FunctionPlacard>(functionPlacards, pageRequest, functionPlacards.size());
		
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		
		model.addAttribute("user", user);
		model.addAttribute("functionPlacards", ps);
		
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/functionplacard/index";
	}
	
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value = "/add" ,method=RequestMethod.GET)
	public String add(Model model){
		Long userId = functionPlacardService.getCurrentUserId();
		User user = accountService.getUser(userId);
		
		return "/game/functionplacard/add";
	}
	
	/**
	 * 操作员编辑页	
	 */
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id")long id,Model model){
		FunctionPlacard functionPlacard = functionPlacardService.findById(id);
		model.addAttribute("functionPlacard", functionPlacard);
		model.addAttribute("id", id);
		return "/game/functionplacard/edit";
	}
	
	/**
	 * 新增操作	 
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String saveStores(FunctionPlacard functionPlacard,RedirectAttributes redirectAttributes){
		functionPlacardService.save(functionPlacard);
		redirectAttributes.addFlashAttribute("message", "新增项目成功");
		//String message = "新增:" +functionPlacard.toString();
		//LogService.log(getCurrentUserName(), message, Log.TYPE_STORE);
		return "redirect:/manage/game/functionPlacard/index";
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public String update(FunctionPlacard functionPlacard,ServletRequest request,RedirectAttributes redirectAttributes){
		System.out.println(functionPlacard.getId() +"  " + functionPlacard.getTitle() + " "+ functionPlacard.getText() );

    	redirectAttributes.addFlashAttribute("message", "服务器列表为空,保存失败");
    	return "redirect:/manage/game/functionPlacard/index";
	}
	
	/**
	 * 删除操作	 
	 * @param oid 用户id
	 * @throws Exception 
	 */
	@RequestMapping(value = "del", method = RequestMethod.DELETE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public Map<String,Object> del(@RequestParam(value = "id")Long id
			) throws Exception{
		 Map<String,Object> map = new HashMap<String, Object>();
		 
		 map.put("message", "ok");
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
