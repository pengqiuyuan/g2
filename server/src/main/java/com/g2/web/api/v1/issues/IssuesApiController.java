package com.g2.web.api.v1.issues;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.g2.entity.game.MonitorIssues;
import com.g2.service.game.MonitorIssuesService;
import com.g2.web.api.BaseApiController;

@Controller
@RequestMapping(value = "/api/v1/issues")
public class IssuesApiController extends BaseApiController{
	
	@Autowired
	private MonitorIssuesService monitorIssuesService;
	
	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder){
		binder.registerCustomEditor(Date.class,"crDate",new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.registerCustomEditor(Date.class,"upDate",new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST ,  produces = "application/json;charset=UTF-8")
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public Map<String, Object> add(@RequestBody MonitorIssues monitorIssues) throws Exception{
		monitorIssuesService.save(monitorIssues);
		return SUCCESS_RESULT;
	}
	
}
