<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>



<title>日志管理</title>
</head>
<body>

	<div>
		<div class="page-header">
			<h4>日志管理</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get"
				action="${ctx}/manage/logger/index">
				<label>操作人：</label> <input name="search_EQ_crUser" type="text"
					value="${param.search_EQ_crUser}" /> <label>日志类型：</label> <select
					name="search_EQ_type" style="width: 200px">
					<option value="">---------请选择---------</option>
					<option value="1" ${param.search_EQ_type == '1' ? 'selected' : '' }>首页查看日志</option>
					<option value="2" ${param.search_EQ_type == '2' ? 'selected' : '' }>账号管理日志</option>
					<option value="3" ${param.search_EQ_type == '3' ? 'selected' : '' }>礼品码日志</option>
					<option value="4" ${param.search_EQ_type == '4' ? 'selected' : '' }>公告日志</option>
					<option value="5" ${param.search_EQ_type == '5' ? 'selected' : '' }>邮件日志</option>
					<option value="6" ${param.search_EQ_type == '6' ? 'selected' : '' }>系统广播日志</option>
					<option value="7" ${param.search_EQ_type == '7' ? 'selected' : '' }>黑名单日志</option>
					<option value="8" ${param.search_EQ_type == '8' ? 'selected' : '' }>服务器状态日志</option>
					<option value="9" ${param.search_EQ_type == '9' ? 'selected' : '' }>游戏配置日志</option>
					<option value="10" ${param.search_EQ_type == '10' ? 'selected' : '' }>意见反馈日志</option>
					<option value="11" ${param.search_EQ_type == '11' ? 'selected' : '' }>基本指标日志</option>
					<option value="12" ${param.search_EQ_type == '12' ? 'selected' : '' }>留存日志</option>
					<option value="13" ${param.search_EQ_type == '13' ? 'selected' : '' }>等级分布日志</option>
					<option value="14" ${param.search_EQ_type == '14' ? 'selected' : '' }>关卡分布日志</option>
					<option value="15" ${param.search_EQ_type == '15' ? 'selected' : '' }>付费点日志</option>
					<option value="16" ${param.search_EQ_type == '16' ? 'selected' : '' }>商城消费日志</option>
				</select> <input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>


		</div>
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="操作人">操作人</th>

					<th title="内容">内容</th>
					<th title="日志类型">日志类型</th>
					<th title="时间" width="240px">时间</th>


				</tr>
			</thead>
			<tbody>

				<c:forEach items="${logs.content}" var="item" varStatus="s">

					<tr>

						<td>
							<div class="btn-group">
								<a class="btn" href="#">#${s.index+1}</a> <a
									class="btn dropdown-toggle" data-toggle="dropdown" href="#">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
								</ul>
							</div>
						</td>
						<td>${item.crUser }</td>
						<td><a
							href="<%=request.getContextPath()%>/manage/logger/detail?id=${item.id}"
							data-fancybox-type="iframe" rel="fancy" title="日志详细"
							class="showInfo"> <c:choose>
									<c:when test="${fn:length(item.content)>10}">
										<c:out value="${fn:substring(item.content,0,10) }..." />
									</c:when>
									<c:otherwise>
										<c:out value="${item.content}" />
									</c:otherwise>
								</c:choose>

						</a></td>
						<td>${item.type == "1" ? "首页查看日志" : item.type == "2" ? "账号管理日志" : item.type == "3" ? "礼品码日志" : item.type == "4"? "公告日志" : item.type == "5" ? "邮件日志" : item.type == "6" ? "系统广播日志" : item.type == "7"? "黑名单日志" : item.type == "8"? "服务器状态日志" : item.type == "9" ? "游戏配置日志" : item.type == "10" ? "意见反馈日志" : item.type == "11" ? "基本指标日志" : item.type == "12"? "留存日志" : item.type == "13" ? "等级分布日志" : item.type == "14" ? "关卡分布日志" : item.type == "15"? "付费点日志" : item.type == "16"? "商城消费日志" : "未知"}</td>
						<td><fmt:formatDate value="${item.crDate}"
								pattern="yyyy/MM/dd  HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${logs}" paginationSize="5" />
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.showInfo').fancybox({
				autoDimensions:false,
				width:800,
				height:500
			});			
			
		});
	</script>
</body>
</html>