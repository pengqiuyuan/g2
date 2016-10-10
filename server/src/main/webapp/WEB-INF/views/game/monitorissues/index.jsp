<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>玩家意见反馈</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>玩家意见反馈</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/monitorIssues/index">
				<label class="control-label" for="serverId">区服：</label>
				<select id="serverId" name="search_EQ_serverId">	
					<option value="">请选择项目</option>
					<option value="全区全服">全区全服</option>
					<c:forEach items="${servers}" var="item" >
						<option value="${item.serverName}">
							${item.serverName}
						</option>
					</c:forEach>
				</select>						
				<label>玩家Id：</label> 
				<input name="search_LIKE_userId" type="text" value="${param.search_LIKE_userId}" />
				<input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号">编号</th>
					<th title="时间">时间</th>
					<th title="区服">区服</th>
					<th title="玩家ID">玩家ID</th>
					<th title="角色名">角色名</th>
					<th title="职业">职业</th>
					<th title="联系方式">联系方式</th>
					<th title="手机型号">手机型号</th>
					<th title="反馈内容">反馈内容</th>
					<th title="操作">操作</th>		
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${monitorIssues.content}" var="item" varStatus="s">
					<tr id="${item.id}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${item.id}</a> 
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath()%>/manage/game/monitorIssues/edit?id=${item.id}"><i class="icon-edit"></i>回复</a></li>
									<li><a href="javascript:void(0);" rel="${item.id}" class="del"><i class="icon-th"></i>删除 </a></li>
									<li class="divider"></li>
								</ul>
							</div>
						</td>
						<td>${item.time}</td>
						<td>${item.server}</td>
						<td>${item.userId}</td>
						<td>${item.name}</td>
						<td>${item.group}</td>
						<td>${item.contact}</td>
						<td>${item.device}</td>
						<td>
							<a href="#" class="intro" title="${item.text}"> 
								<c:choose>
									<c:when test="${fn:length(item.text)>100 }">
										<c:out value="${fn:substring(item.text,0,100) }..." />
									</c:when>
									<c:otherwise>
										<c:out value="${item.text }" />
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td>
							<div class="action-buttons">
								<a class="exportCode btn table-actions" href="${ctx}/manage/game/monitorIssues/edit?id=${item.id}" ><i class="icon-ok"></i>回复</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${monitorIssues}" paginationSize="5" />
	</div>
	<script type="text/javascript">
		$(function(){
			$('.intro').tooltip();
		});
		$(document).ready(function(){
			$(".del").click(function(){
				if(confirm("该操作会删除。。。。！")){
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/game/monitorIssues/del?id='+ id,
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