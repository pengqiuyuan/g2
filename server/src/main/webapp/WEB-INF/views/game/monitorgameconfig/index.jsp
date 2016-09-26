<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>游戏配置信息</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>游戏配置信息</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/monitorGameConfig/index">
				<label>配置项：</label> 
				<input name="search_LIKE_configKey" type="text" value="${param.search_LIKE_configKey}" />
				<input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="配置项">配置项D</th>
					<th title="配置值">配置值</th>
					<th title="作用备注">作用备注</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${monitorGameConfigs.content}" var="item" varStatus="s">
					<tr id="${item.id}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${item.id}</a> 
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath()%>/manage/game/monitorGameConfig/edit?id=${item.id}"><i class="icon-edit"></i>修改</a></li>
									<li><a href="javascript:void(0);" rel="${item.id}" class="del"><i class="icon-th"></i>删除 </a></li>
									<li class="divider"></li>
								</ul>
							</div>
						</td>
						<td>${item.configKey}</td>
						<td>${item.configValue}</td>
						<td>${item.nodes}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${monitorGameConfigs}" paginationSize="5" />
		<div class="form-actions">
			<a href="<%=request.getContextPath()%>/manage/game/monitorGameConfig/add" class="btn btn-primary">新增服务器配置信息</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".del").click(function(){
				if(confirm("该操作会删除。。。。！")){
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/game/monitorGameConfig/del?id='+ id,
						type : 'DELETE',
						contentType : "application/json;charset=UTF-8",
						dataType : 'json',
						success : function(data) {
							window.location.href = window.location.href;
						},
						error : function(xhr) {
							alert('错误了，请重试');
						}
					});
				}
			});
		});
	</script>
</body>
</html>