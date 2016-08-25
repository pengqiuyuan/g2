<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>等级详情</title>
    <!-- 引入 G2 文件 -->
    <script src="${ctx}/static/g2/index.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.css">
</head>
<body>
	<div>
		<div class="page-header">
			<h4>
				等级详情
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
						<div class="tabbable span12">
							<p><code>近日概况</code></p>
							<table class="table table-striped table-bordered table-condensed" id="table">
								<thead>
									<tr>
										<th title="编号" width="120px">编号</th>
										<th title="名称">名称</th>
										<th title="指标">指标</th>
										<th title="新增用户">新增用户</th>
										<th title="活跃用户">活跃用户</th>
										<th title="新用户占比">新用户占比</th>
										<th title="启动(次数 | 人均)">启动(次数 | 人均)</th>
										<th title="平均使用时长">平均使用时长</th>
										<th title="日活跃率">日活跃率</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach items="${serverZones}" var="item" varStatus="s">
										<tr id="${item.id}">
											<td id="iDictionary" value="${item.id}">
												<div class="btn-group">
													<a class="btn" href="#">#${item.id}</a> 
													<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
													<ul class="dropdown-menu">
														<li><a href="<%=request.getContextPath()%>/manage/serverZone/edit?id=${item.id}"><i class="icon-edit"></i>修改</a></li>
														<li><a href="javascript:void(0);" rel="${item.id}" class="del"><i class="icon-th"></i>删除 </a></li>
														<li class="divider"></li>
														<li><a href="#">sample</a></li>
													</ul>
												</div>
											</td>
											<td><a href="#" data-fancybox-type="iframe" rel="fancy" title="游戏详细" class="showInfo">${item.serverName}</a></td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
											<td>${item.serverName }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row-fluid">
						<div class="tabbable span6">
							<p class=""><code>应用摘要</code></p>
							<table class="table table-striped table-bordered table-condensed" id="table">
								<thead>
									<tr>
										<th title="编号" width="120px">编号</th>
										<th title="累计用户总数">累计用户总数</th>
										<th title="一次性用户(%)">一次性用户（%）</th>
										<th title="启动（总数 | 近30日每日人均）">启动（总数 | 近30日每日人均）</th>
									</tr>
								</thead>
								<tbody id="tbody">
										<tr>
											<td id="iDictionary">
												<div class="btn-group">
													<a class="btn" href="#">#1</a> 
													<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
													<ul class="dropdown-menu">
														<li><a href="#"><i class="icon-edit"></i>修改</a></li>
														<li><a href="javascript:void(0);" class="del"><i class="icon-th"></i>删除 </a></li>
														<li class="divider"></li>
														<li><a href="#">sample</a></li>
													</ul>
												</div>
											</td>
											<td>19177633</td>
											<td>3079976 ( 27.0% )</td>
											<td>267304281 | 1.7</td>
										</tr>
								</tbody>
							</table>
						</div>
						<div class="tabbable span6">
							<p class=""><code>活跃概况(昨日)</code></p>
							<table class="table table-striped table-bordered table-condensed" id="table">
								<thead>
									<tr>
										<th title="编号" width="120px">编号</th>
										<th title="周活跃（%）">周活跃（%）</th>
										<th title="月活跃（%）">月活跃（%）</th>
										<th title="次日留存率均值">次日留存率均值</th>
									</tr>
								</thead>
								<tbody id="tbody">
										<tr>
											<td id="iDictionary">
												<div class="btn-group">
													<a class="btn" href="#">#1</a> 
													<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
													<ul class="dropdown-menu">
														<li><a href="#"><i class="icon-edit"></i>修改</a></li>
														<li><a href="javascript:void(0);" class="del"><i class="icon-th"></i>删除 </a></li>
														<li class="divider"></li>
														<li><a href="#">sample</a></li>
													</ul>
												</div>
											</td>
											<td>1358468 （ 7.1% ）</td>
											<td>3209523 （ 16.7% ）</td>
											<td>25.5%</td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row-fluid">
						<div class="tabbable span6">
							<p class=""><code>30日数据趋势</code></p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#a1" data-toggle="tab">新增用户</a></li>
								<li><a href="#a2" data-toggle="tab">活跃用户</a></li>
								<li><a href="#a3" data-toggle="tab">平均使用时长</a></li>
								<li><a href="#a4" data-toggle="tab">启动次数</a></li>
								<li><a href="#a5" data-toggle="tab">累计用户</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="a1">
									<div id="chart_a1"></div>
								</div>
								<div class="tab-pane" id="a2">
									<div id="chart_a2"></div>
								</div>
								<div class="tab-pane" id="a3">
									<div id="chart_a3"></div>
								</div>
								<div class="tab-pane" id="a4">
									<div id="chart_a4"></div>
								</div>
								<div class="tab-pane" id="a5">
									<div id="chart_a5"></div>
								</div>
							</div>
						</div>
						<div class="tabbable span6">
							<p class=""><code>时段分析</code></p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#b1" data-toggle="tab">新增用户</a></li>
								<li><a href="#b2" data-toggle="tab">启动次数</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="b1">
									<div class="span6" id="chart_b1"></div>
								</div>
								<div class="tab-pane" id="b2">
									<div class="span6" id="chart_b2"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="tabbable span6">
							<p class=""><code>Top10 用户地区</code></p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#c1" data-toggle="tab">昨日</a></li>
								<li><a href="#c2" data-toggle="tab">今日</a></li>
								<li><a href="#c3" data-toggle="tab">近7日</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="c1">
									<div id="chart_c1"></div>
								</div>
								<div class="tab-pane" id="c2">
									<div id="chart_c2"></div>
								</div>
								<div class="tab-pane active" id="c3">
									<div id="chart_c3"></div>
								</div>
							</div>
						</div>
						<div class="tabbable span6">
							<p class=""><code>Top10 渠道来源</code></p>
							<ul class="nav nav-tabs">
								<li class="active"><a href="#d1" data-toggle="tab">昨日</a></li>
								<li><a href="#d2" data-toggle="tab">今日</a></li>
								<li><a href="#d3" data-toggle="tab">近7日</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="d1">
									<div id="chart_d1"></div>
								</div>
								<div class="tab-pane" id="d2">
									<div id="chart_d2"></div>
								</div>
								<div class="tab-pane" id="d3">
									<div id="chart_d3"></div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<%@ include file="chart.jsp"%>
	<script type="text/javascript">
		// G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。
		// Step 1: 创建 Chart 对象
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
		});
	</script>
</body> 	