<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>游戏概况</title>
    <!-- 引入 G2 文件 -->
    <script src="${ctx}/static/g2/index.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.css">
</head>
<body>
	<div>
		<div class="page-header">
			<h4>
				游戏概况
				<c:if test="${user.roles != 'admin' ? 'true':'false' }"><!-- 非管理员 -->
					<span id="storeName">（<huake:getStoreNameTag id="${user.storeId}"></huake:getStoreNameTag>）</span>
				</c:if>
			</h4>
		</div>
		<div class="container-fluid">
			<form id="inputForm"  Class="form-horizontal" >
				<div class="control-group">
					<label class="control-label" for="storeId">项目名称：</label>
					<div class="controls">
						<select id="storeId" name="search_EQ_storeId">	
							<option value="">请选择项目</option>
							<c:if test="${user.roles != 'admin' ? 'true':'false' }"> <!-- 非管理员 -->
								<c:forEach items="${stores}" var="item" >
									<option value="${item.name}"  ${user.storeId == item.id ? 'selected' : '' }>
										${item.name}
									</option>
								</c:forEach>
							</c:if>
							<c:if test="${user.roles == 'admin' ? 'true':'false' }"> <!-- 管理员 -->
								<c:forEach items="${stores}" var="item" >
									<option value="${item.name}"  ${param.search_EQ_storeId == item.name ? 'selected' : '' }>
										${item.name}
									</option>
								</c:forEach>
							</c:if>
						</select>
						<span id="error_storeId" class="error" hidden="hidden">项目必须填写</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="datetimepickerStart">起始时间：</label>
					<div class="controls">
						<div id="datetimepickerStart" class="input-append date">
							<input type="text" name="search_EQ_dateFrom" value="${param.search_EQ_dateFrom == null ? dateFrom : param.search_EQ_dateFrom }" id="dateFrom"></input> 
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateFrom" class="error" hidden="hidden">起始查询时间必须填写</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="datetimepickerEnd">结束时间：</label>
					<div class="controls">
						<div id="datetimepickerEnd" class="input-append date">
							<input type="text" name="search_EQ_dateTo" value="${param.search_EQ_dateTo == null ? dateTo : param.search_EQ_dateTo}" id="dateTo"></input>
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateTo" class="error" hidden="hidden">结束查询时间必须填写</span>
						<span id="error_dateTo_vs_dateFrom" class="error" hidden="hidden">结束时间不能小于开始时间</span>
					</div>

				</div>
				<div class="control-group">
					<label class="control-label"></label> 
					<div class="controls">
						<a href="#" class="btn btn-success" id="yesterday">昨日</a> 
						<a href="#" class="btn btn-success" id="sevenDayAgo">近7日</a> 
						<a href="#" class="btn btn-success" id="thirtyDayAgo">近30日</a>
						<a href="#" class="btn btn-primary" id="condition">${paramValues.search_EQ_serverZoneId == null && paramValues.search_EQ_pfId == null ? '开启筛选条件' : '关闭筛选条件'}</a>
					</div>
				</div>
				<div id="conditionX" ${paramValues.search_EQ_serverZoneId == null && paramValues.search_EQ_pfId == null ? 'hidden' : ''}>
					<div class="control-group">
						<label class="control-label" for="serverZoneId">运营大区：</label>
						<div class="controls">
							<c:forEach items="${serverZones}" var="ite" varStatus="j">
								<label class="checkbox inline"> 
									<input type="checkbox" class="box" name="search_EQ_serverZoneId" <c:forEach items="${paramValues.search_EQ_serverZoneId}" var='pte'>${ite.id == pte ? 'checked' : ''}</c:forEach>  value="${ite.id}" id="${ite.id}" /> 
									<span>${ite.serverName}</span>&nbsp;&nbsp;&nbsp;
									<c:if test="${(j.index+1)%7 == 0}">
									</c:if>
								</label>
							</c:forEach>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="platformId">渠道：</label>
						<div class="controls">
							<c:forEach items="${platForms}" var="ite" varStatus="j">
								<label class="checkbox inline"> 
								<input type="checkbox" class="box" name="search_EQ_pfId" <c:forEach items="${paramValues.search_EQ_pfId}" var='pte'>${ite.id == pte ? 'checked' : ''}</c:forEach> value="${ite.id}" id="${ite.id}" /> 
								<span>${ite.pfName}</span>&nbsp;&nbsp;&nbsp;
									<c:if test="${(j.index+1)%7 == 0}">
									</c:if>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">确定</span>
						</button>
						<a href="<%=request.getContextPath()%>/manage/store/index" class="btn btn-primary">返回</a>
					</div>
				</div>
			</form>
			<div class="row-fluid">
					<div class="row-fluid">
						<div class="tabbable span6">
							<p class="">30日数据趋势</p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_30_newuser" data-toggle="tab">新增用户</a></li>
								<li><a href="#tab_30_activeuser" data-toggle="tab">活跃用户</a></li>
								<li><a href="#tab_30_usertime" data-toggle="tab">平均使用时长</a></li>
								<li><a href="#tab_30_startup" data-toggle="tab">启动次数</a></li>
								<li><a href="#tab_30_totaluser" data-toggle="tab">累计用户</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_30_newuser">
									<div id="c_30_newuser"></div>
								</div>
								<div class="tab-pane" id="tab_30_activeuser">
									<div id="c_30_activeuser"></div>
								</div>
								<div class="tab-pane active" id="tab_30_usertime">
									<div id="c_30_usertime"></div>
								</div>
								<div class="tab-pane" id="tab_30_startup">
									<div id="c_30_startup"></div>
								</div>
								<div class="tab-pane" id="tab_30_totaluser">
									<div id="c_30_totaluser"></div>
								</div>
							</div>
						</div>
						<div class="tabbable span6">
							<p class="">时段分析</p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_timeframe_newuser" data-toggle="tab">新增用户</a></li>
								<li><a href="#tab_timeframe_startup" data-toggle="tab">启动次数</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_timeframe_newuser">
									<div class="span6" id="c_timeframe_newuser"></div>
								</div>
								<div class="tab-pane" id="tab_timeframe_startup">
									<div class="span6" id="c_timeframe_startup"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="tabbable span6">
							<p class="">Top10 用户地区</p>
							<ul class="nav nav-tabs">
								<li><a href="#tab_top_area_1" data-toggle="tab">昨日</a></li>
								<li><a href="#tab_top_area_2" data-toggle="tab">今日</a></li>
								<li><a href="#tab_top_area_3" data-toggle="tab">近7日</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="#tab_top_area_1">
									<div id="c_top_area_1"></div>
								</div>
								<div class="tab-pane" id="#tab_top_area_2">
									<div id="c_top_area_2"></div>
								</div>
								<div class="tab-pane active" id="#tab_top_area_3">
									<div id="c_top_area_3"></div>
								</div>
							</div>
						</div>
						<div class="tabbable span6">
							<p class="">Top10 渠道来源</p>
							<ul class="nav nav-tabs">
								<li><a href="#tab_top_platform_1" data-toggle="tab">昨日</a></li>
								<li><a href="#tab_top_platForm_2" data-toggle="tab">今日</a></li>
								<li><a href="#tab_top_platForm_3" data-toggle="tab">近7日</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="#tab_top_platform_1">
									<div class="span6" id="c_top_platform_1"></div>
								</div>
								<div class="tab-pane" id="#tab_top_platform_2">
									<div class="span6" id="c_top_platform_2"></div>
								</div>
								<div class="tab-pane" id="#tab_top_platform_3">
									<div class="span6" id="c_top_platform_3"></div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		// G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。
		// Step 1: 创建 Chart 对象
		var c_30_newuser = ${c_30_newuser}; 
		var c_30_activeuser = ${c_30_activeuser};
		var c_timeframe_newuser = ${c_timeframe_newuser};
		$("#storeId").change(function(){
			var storeName = $("#storeId").val();
			$("#storeName").empty();
			if(storeName!=""){
				$("#storeName").text("（"+$("#storeId").val()+"）");
			}else{
				$("#storeName").text("");
			}
		})
	    $("#condition").click(function(){
	    	if($("#condition").text() == "开启筛选条件"){
	    		$("#condition").text("关闭筛选条件");
	    		$("#conditionX").show();
	    	}else{
	    		$("#condition").text("开启筛选条件");
	    		$("#conditionX").hide();
	    		$("input[type='checkbox']").attr("checked", false);
	    	}
	    });
		$('#datetimepickerStart').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : true,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});
		$('#datetimepickerEnd').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : true,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});
		//---------------------- c_30_newuser ----------------
		var chart1 = new G2.Chart({
			id : 'c_30_newuser', // 指定图表容器 ID
			width : 800, // 指定图表宽度
			height : 400
		// 指定图表高度
		});
		// Step 2: 载入数据源
		chart1.source(c_30_newuser, {
			genre : {
				alias : '游戏种类' // 列定义，定义该属性显示的别名
			},
			sold : {
				alias : '销售量'
			}
		});
		// Step 3：创建图形语法，绘制柱状图，由 genre 和 sold 两个属性决定图形位置，genre 映射至 x 轴，sold 映射至 y 轴
		chart1.interval().position('genre*sold').color('genre')
		// Step 4: 渲染图表
		chart1.render();
		//---------------------- c_30_newuser ----------------
		
		//---------------------- c_30_activeuser ----------------
		var chart2 = new G2.Chart({
			id : 'c_30_activeuser',
			width : 800,
			height : 400
		});
		chart2.source(c_30_activeuser, {
			'LifeExpectancy' : {
				alias : '人均寿命（年）'
			},
			'Population' : {
				type : 'pow',
				alias : '人口总数'
			},
			'GDP' : {
				alias : '人均国内生产总值($)',
				tickCount : 10
			},
			'Country' : {
				alias : '国家/地区'
			}
		});
		chart2.axis('GDP', {
			// 格式化坐标轴的显示
			formatter : function(value) {
				return (value / 1000).toFixed(0) + 'k';
			}
		});
		chart2.tooltip({
			title : null
		// 不显示默认标题
		});
		chart2.legend('Population', false);
		chart2.legend('Country', false);
		chart2.point().position('GDP*LifeExpectancy').size('Population', 35, 5)
				.color('continent').opacity(0.65).shape('circle').tooltip(
						'Country*Population*GDP*LifeExpectancy');
		chart2.render();
		//---------------------- c_30_activeuser ----------------
		
		//---------------------- c_timeframe_newuser ----------------
		var chart6 = new G2.Chart({
			id : 'c_timeframe_newuser',
			width : 1000,
			height : 500
		});
		var defs = {
			'month' : {
				type : 'cat',
				values : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
						'九月', '十月', '十一月', '十二月' ]
			}
		};
		chart6.source(c_timeframe_newuser, defs);
		chart6.line().position('month*tem').color('city').shape('dot').size(3);
		chart6.render();
		//---------------------- c_timeframe_newuser ----------------

		$(function() {
			$("#inputForm").validate({
				rules:{
					search_EQ_storeId:{
						required:true
					},
					search_EQ_dateFrom:{
						required:true
					},
					search_EQ_dateTo:{
						required:true
					}
				},messages:{
					search_EQ_storeId:{
						required:"查询项目必须填写"
					},
					search_EQ_dateFrom:{
						required:"起始时间必须填写"
					},
					search_EQ_dateTo:{
						required:"结束时间必须填写"
					}
				}
			});
			
			$("#yesterday").click(function() {
				chart1.repaint();
				$.ajax({
					url : '<%=request.getContextPath()%>/manage/game/summary/getDate',
					type: 'GET',
					contentType: "application/json;charset=UTF-8",		
					dataType: 'text',
					success: function(data){
						var parsedJson = $.parseJSON(data);
						$("#dateFrom").val(parsedJson.yesterday);
						$("#dateTo").val(parsedJson.nowDate);
					},error:function(xhr){
						window.location.href = window.location.href;
					}//回调看看是否有出错
				});
			});
			$("#sevenDayAgo").click(function(){
				$.ajax({                                               
					url: '<%=request.getContextPath()%>/manage/game/summary/getDate',
					type: 'GET',
					contentType: "application/json;charset=UTF-8",		
					dataType: 'text',
					success: function(data){
						var parsedJson = $.parseJSON(data);
						$("#dateFrom").val(parsedJson.sevenDayAgo);
						$("#dateTo").val(parsedJson.nowDate);
					},error:function(xhr){
						window.location.href = window.location.href;
					}//回调看看是否有出错
				});
			});
			$("#thirtyDayAgo").click(function(){
				$.ajax({                                               
					url: '<%=request.getContextPath()%>/manage/game/summary/getDate',
					type: 'GET',
					contentType: "application/json;charset=UTF-8",		
					dataType: 'text',
					success: function(data){
						var parsedJson = $.parseJSON(data);
						$("#dateFrom").val(parsedJson.thirtyDayAgo);
						$("#dateTo").val(parsedJson.nowDate);
					},error:function(xhr){
						window.location.href = window.location.href;
					}//回调看看是否有出错
				});
			});		
			$("#sub").click(function(){
				$("#error_storeId").hide();
				$("#error_dateFrom").hide();
				$("#error_dateTo").hide();
				$("#error_dateTo_vs_dateFrom").hide();
				var storeName = $("#storeId").val();
				var dateFrom = $("#dateFrom").val();
				var dateTo = $("#dateTo").val();
				if(storeName == ""){ $("#error_storeId").show(); return;}
				if(dateFrom == ""){ $("#error_dateFrom").show(); return;}
				if(dateTo == ""){$("#error_dateTo").show();return;}
				
		        var startTime = new Date(dateFrom).getTime();
		        var endTime = new Date(dateTo).getTime();
	        	if(startTime>endTime){$("#error_dateTo_vs_dateFrom").show();return;}
				
				var serverZoneId = $("input[name='search_EQ_serverZoneId']:checked").serialize();
				var pfId = $("input[name='search_EQ_pfId']:checked").serialize();
				$.ajax({                                               
					url: '<%=request.getContextPath()%>/manage/game/summary/findIndex?search_EQ_storeName='+storeName+'&search_EQ_dateFrom='+dateFrom+'&search_EQ_dateTo='+dateTo+'&'+serverZoneId+'&'+pfId,
					type: 'GET',
					contentType: "application/json;charset=UTF-8",		
					dataType: 'text',
					success: function(data){
						var parsedJson = $.parseJSON(data);
						var d1 = $.parseJSON(parsedJson.c_30_newuser);
						var d2 = $.parseJSON(parsedJson.c_30_activeuser);
						var d6 = $.parseJSON(parsedJson.c_timeframe_newuser);
						chart1.changeData(d1);
						chart2.changeData(d2);
						chart6.changeData(d6);
					},error:function(xhr){
						window.location.href = window.location.href;
					}//回调看看是否有出错
				});
			});
		});
	</script>
</body> 	