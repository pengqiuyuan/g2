<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>门店管理</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>门店管理</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/store/index">
				<label>名称：</label> 
				<input name="search_LIKE_name" type="text"  value="${param.search_LIKE_name}" /> 
				<input type="submit" class="btn btn-default" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="名称">名称</th>
					<th title="addr">地址</th>
					<th title="tel">电话</th>
					<th title="创建时间" width="240px">创建时间</th>
					<th title="排序">排序</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${stores.content}" var="item" varStatus="s">
					<tr id="${item.id}" value="${item.sort}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${s.index+1}</a> <a
									class="btn dropdown-toggle" data-toggle="dropdown" href="#">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li><a
										href="<%=request.getContextPath()%>/manage/store/edit?id=${item.id}"><i
											class="icon-edit"></i>修改</a></li>
									<shiro:hasAnyRoles name="admin">
										<c:if test="${item.id == 1 ? false : true}">
											<li><a href="javascript:void(0);" rel="${item.id}"
												class="del"><i class="icon-th"></i>删除 </a></li>
										</c:if>
									</shiro:hasAnyRoles>
								</ul>
							</div>
						</td>
						<td><a href="<%=request.getContextPath()%>/manage/store/detail?id=${item.id}" data-fancybox-type="iframe" rel="fancy" title="门店详细" class="showInfo">${item.name }</a></td>
						<td>${item.addr}</td>
						<td>${item.tel}</td>
						<td><fmt:formatDate value="${item.createDate}" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
						<td id="seq">${item.sort}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${stores}" paginationSize="5" />
		<shiro:hasAnyRoles name="admin">
			<div class="form-actions">
				<a href="<%=request.getContextPath()%>/manage/store/add" class="btn btn-primary">新增门店</a>
			</div>
		</shiro:hasAnyRoles>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".del").click(function(){
				if(confirm("该操作会删除门店所属商品！"))
			    {
				var id = $(this).attr("rel");
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/store/del?id=' + id, 
						type: 'DELETE',
						contentType: "application/json;charset=UTF-8",
						dataType: 'json',
						success: function(data){
							window.location.href = window.location.href;
						},error:function(xhr){
							alert('错误了，请重试');
						}
					});
			     }
			});
		});
	</script>
</body>
</html>