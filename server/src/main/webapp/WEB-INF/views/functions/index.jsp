<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
	<head>
		<title>功能权限管理</title>
	</head>
<body>
	<div>
		<div class="page-header">
			<h4>功能权限管理</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/functions/index">
				<label>一级名称：</label> 
				<select name="search_EQ_firstName">
					<option value="">---------请选择---------</option>
					<c:forEach items = "${firstNa}" var="first">
						<option  value="${first}" ${param.search_EQ_firstName == first ? "selected":"" }>${first}</option>
					</c:forEach>
				</select>
				<!-- 
				<label>状态：</label> 
				<select name="search_EQ_status">
					<option value="">---------请选择---------</option>
					<option value="1" ${param.search_EQ_status == '1' ? 'selected' : '' }>正常</option>
					<option value="0" ${param.search_EQ_status == '0' ? 'selected' : '' }>冻结</option>
				</select> 
				-->
				<input type="submit" class="btn btn-default" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="一级名称">一级名称</th>
					<th title="二级名称">二级名称</th>
					<th title="权限">权限</th>
					<th title="状态">状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${function.content}" var="item" varStatus="s">
					<tr>
						<td>
							<div class="btn-group">
								<a class="btn" href="#">#${s.index+1}</a> 
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
									<span class="caret"></span>
								</a>
																	<!-- 
								<ul class="dropdown-menu">

									<li><a href="<%=request.getContextPath()%>/manage/functions/edit?id=${item.id}"><i class="icon-edit"></i>修改</a></li>
									<li><a href="javascript:void(0);" rel="${item.id}" class="lock"><i class="icon-th"></i>冻结</a></li>
									<li><a href="javascript:void(0);" rel="${item.id}" class="unlock"><i class="icon-th"></i>激活</a></li>
									<li><a href="javascript:void(0);" rel="${item.id}" class="userdel"><i class="icon-th"></i>删除</a></li>
									<li><a href="<%=request.getContextPath()%>/manage/functions/resetPwd?id=${item.id}"><i class="icon-edit"></i>重置密码</a></li>

								</ul>
																	 -->
							</div>
						</td>
						<td>${item.firstName}</td>
						<td>${item.secondName}</td>
						<td>${item.role}</td>
						<td>${item.status == '1' ? '正常' : '冻结' }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${function}" paginationSize="5" />
		<div class="form-actions">
			<a href="<%=request.getContextPath()%>/manage/functions/add" class="btn btn-primary">新增功能权限</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".lock").click(function(){
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/functions/lock?id=' + id, 
						type: 'GET',
						contentType: "application/json;charset=UTF-8",
						dataType: 'json',
						success: function(data){
							window.location.href = window.location.href;
						},error:function(xhr){
							alert('错误了，请重试');
						}
					});
				
			});
			
			$(".unlock").click(function(){
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/functions/unlock?id=' + id, 
						type: 'GET',
						contentType: "application/json;charset=UTF-8",
						dataType: 'json',
						success: function(data){
							window.location.href = window.location.href;
						},error:function(xhr){
							alert('错误了，请重试');
						}
					});
				
			});
		});
		</script>
</body>
</html>