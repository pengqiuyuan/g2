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
	<title>封禁账号</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>封禁账号</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/functionSeal/index">
				<label class="control-label" for="serverName">区服：</label>
				<select id="serverName" name="search_EQ_serverName">	
					<option value="">请选择项目</option>
					<c:forEach items="${servers}" var="item" >
						<option value="${item.serverName}">
							${item.serverName}
						</option>
					</c:forEach>
				</select>	
				<label>玩家ID：</label> 
				<input name="search_LIKE_userId" type="text" value="${param.search_LIKE_userId}" />
				<label>玩家名：</label> 
				<input id="userName" type="text" value="战神无双"  disabled="disabled"/>
				<input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="区服">区服</th>
					<th title="玩家ID">玩家ID</th>
					<th title="玩家名">玩家名</th>
					<th title="生效日期">生效日期</th>
					<th title="结束日期">结束日期</th>
					<th title="原因备注">原因备注</th>
					<th title="操作">操作</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${functionSeals.content}" var="item" varStatus="s">
					<tr id="${item.id}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${item.id}</a> 
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="javascript:void(0);" rel="${item.id}" class="del"><i class="icon-th"></i>解封账号 </a></li>
									<li class="divider"></li>
								</ul>
							</div>
						</td>
						<td>${item.serverName}</td>
						<td>${item.userId}</td>
						<td>${item.userName}</td>
						<td>${item.sealStart}</td>
						<td>${item.sealEnd}</td>
						<td>
							<a href="#" class="intro" title="${item.causes}"> 
								<c:choose>
									<c:when test="${fn:length(item.causes)>3 }">
										<c:out value="${fn:substring(item.causes,0,3) }..." />
									</c:when>
									<c:otherwise>
										<c:out value="${item.causes }" />
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td>
							<div class="action-buttons">
								<a class="exportCode btn table-actions del" href="javascript:void(0);" rel="${item.id}"><i class="icon-remove"></i>解封账号</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${functionSeals}" paginationSize="5" />
		<div class="form-actions">
			<a href="<%=request.getContextPath()%>/manage/game/functionSeal/add" class="btn btn-primary">封禁账号</a>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('.intro').tooltip();
		});
		$(document).ready(function(){
			$(".del").click(function(){
				if(confirm("该操作会解封账号。。。。！")){
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/game/functionSeal/del?id='+ id,
						type : 'DELETE',
						contentType : "application/json;charset=UTF-8",
						dataType : 'json',
						success : function(data) {
							alert("账号解封成功！");
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