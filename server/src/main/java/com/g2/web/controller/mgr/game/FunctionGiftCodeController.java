package com.g2.web.controller.mgr.game;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.g2.entity.Log;
import com.g2.entity.User;
import com.g2.entity.game.ConfigServer;
import com.g2.entity.game.FunctionGiftCode;
import com.g2.entity.game.FunctionGiftKey;
import com.g2.service.account.AccountService;
import com.g2.service.game.FunctionGiftCodeService;
import com.g2.service.game.FunctionGiftKeyService;
import com.g2.service.log.LogService;
import com.g2.util.JsonBinder;
import com.g2.util.SpringHttpClient;
import com.g2.web.controller.mgr.BaseController;
import com.google.common.collect.Maps;

/**
 *  礼品码管理的controller
 *
 */
@Controller("functionGiftCodeController")
@RequestMapping(value="/manage/game/functionGiftCode")
public class FunctionGiftCodeController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(FunctionGiftCodeController.class);
	
	private static final String PAGE_SIZE = "15";
	
	SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd" ); 
	Calendar calendar = new GregorianCalendar(); 

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

	static {
		sortTypes.put("auto", "编号");
		sortTypes.put("id", "id");
		sortTypes.put("giftNum", "按最新批次");
	}
	
	public static Map<String, String> getSortTypes() {
		return sortTypes;
	}

	public static void setSortTypes(Map<String, String> sortTypes) {
		FunctionGiftCodeController.sortTypes = sortTypes;
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
	private FunctionGiftCodeService functionGiftCodeService;
	
	@Autowired
	private FunctionGiftKeyService functionGiftKeyService;
	
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
		logger.debug("礼品码批次管理");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = functionGiftCodeService.getCurrentUserId();
		User user = accountService.getUser(userId);

		Page<FunctionGiftCode> functionGiftCodes = functionGiftCodeService.findConfigByCondition(userId,searchParams, pageNumber, pageSize, sortType);
		
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("user", user);
		model.addAttribute("functionGiftCodes", functionGiftCodes);
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		model.addAttribute("servers", beanList);
		
		logService.log(functionGiftCodeService.getCurrentUser().getName(), functionGiftCodeService.getCurrentUser().getName() + "：礼品码页面", Log.TYPE_FUNCTION_GIFTCODE);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		return "/game/functiongiftcode/index";
	}
	
	
	
	/**
	 * 新增页面
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	@RequestMapping(value = "/add" ,method=RequestMethod.GET)
	public String add(Model model) throws JsonParseException, JsonMappingException, IOException{
		Long userId = functionGiftCodeService.getCurrentUserId();
		User user = accountService.getUser(userId);
		List<ConfigServer> beanList = binder.getMapper().readValue(new SpringHttpClient().getMethodStr(excelUrl), new TypeReference<List<ConfigServer>>() {}); 
		model.addAttribute("servers", beanList);
		return "/game/functiongiftcode/add";
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value = "/save",method=RequestMethod.POST)
	public String save(FunctionGiftCode functionGiftCode,ServletRequest request,RedirectAttributes redirectAttributes,Model model){
		/*保存礼品码批次*/
		functionGiftCode.setGiftUseNum("0");
		functionGiftCode.setGiftNum(functionGiftCodeService.nowDateString());
		functionGiftCodeService.save(functionGiftCode);
		/*保存礼品码批次*/
		
		/*保存批次下的cdkey*/
		Integer num = Integer.valueOf(functionGiftCode.getGiftBuildNum());
		for (int i = 0; i < num; i++) {
			FunctionGiftKey functionGiftKey = new FunctionGiftKey();
			functionGiftKey.setGiftNum(functionGiftCode.getGiftNum());
			functionGiftKey.setGiftUse(FunctionGiftKey.GIFT_0);
			functionGiftKey.setGiftKey(functionGiftKeyService.getCdKey().substring(0, 7));
			functionGiftKey.setStartDate(functionGiftCode.getStartDate());
			functionGiftKey.setEndDate(functionGiftCode.getEndDate());
			functionGiftKey.setItemId(functionGiftCode.getItemId());
			functionGiftKey.setItemNum(functionGiftCode.getItemNum());
			functionGiftKey.setNotes(functionGiftCode.getNotes());
			functionGiftKeyService.save(functionGiftKey);
		}
		/*保存批次下的cdkey*/
		logService.log(functionGiftCodeService.getCurrentUser().getName(), functionGiftCodeService.getCurrentUser().getName() + "：新增礼品码", Log.TYPE_FUNCTION_GIFTCODE);
		redirectAttributes.addFlashAttribute("message", "新增礼品码成功");
		return "redirect:/manage/game/functionGiftCode/index";
	}
	
	/**
	 * 导出礼品码
	 */
	@RequestMapping(value = "/excel")
	public String excel(ServletRequest request,RedirectAttributes redirectAttributes,Model model){
		
		logService.log(functionGiftCodeService.getCurrentUser().getName(), functionGiftCodeService.getCurrentUser().getName() + "：导出礼品码", Log.TYPE_FUNCTION_GIFTCODE);
		redirectAttributes.addFlashAttribute("message", "礼品码excel导出成功");
		return "redirect:/manage/game/functionGiftCode/index";
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
