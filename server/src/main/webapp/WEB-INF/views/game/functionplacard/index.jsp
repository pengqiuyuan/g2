<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="huake" uri="/huake"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>登录公告</title>
</head>
<body>

	<div >
		<div class="page-header">
			<h4>登录公告</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
		</div>
		<div class="control-group">
				<table class="table table-striped table-bordered table-condensed" id="table">
					<thead>
						<tr>
		                    <th title="ID">ID</th>
							<th title="添加时间">添加时间</th>
							<th title="标题">标题</th>
							<th title="内容">内容</th>
							<th title="操作">操作</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${functionPlacards.content}" var="item" varStatus="s">
							<tr id="${item.id}">
								<td>
									<div class="btn-group">
										<a class="btn" href="#">#${s.index+1}</a> <a
											class="btn dropdown-toggle" data-toggle="dropdown" href="#">
											<span class="caret"></span>
										</a>
									</div>
								</td>
								<td><fmt:formatDate value="${item.crDate}" pattern="yyyy/MM/dd" /></td>
								<td>${item.title}</td>
								<td><a href="#"  class="intro" title="${item.text}" >
								<c:choose> 
			    					<c:when test="${fn:length(item.text)>3 }"> 
			     						<c:out value="${fn:substring(item.text,0,3) }..." /> 
			    					</c:when> 
			    					<c:otherwise> 
			     						<c:out value="${item.text }" /> 
			    					</c:otherwise> 
			   					</c:choose>
			   					</a>
			   					</td>
			   					<td>
									<div class="action-buttons">
										<a class="exportCode btn table-actions" href="${ctx}/manage/game/functionPlacard/edit?id=${item.id}" ><i class="icon-ok"></i>修改</a>
									    <a class="exportCode btn table-actions" onclick="delPlacard('${item.id}')"><i class="icon-remove"></i>删除</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<tags:pagination page="${functionPlacards}" paginationSize="5"/>
				<div class="form-actions">
					  <a href="${ctx}/manage/game/functionPlacard/add" class="btn btn-primary">新增公告</a>
				</div>
		</div>
	</div>
	<script type="text/javascript">
			$(function(){
				$('.intro').tooltip();
			});
			function delPlacard(id){
				if(confirm("该操作会删除。。。。！"))
				    {
							$.ajax({
								url: '<%=request.getContextPath()%>/manage/game/functionPlacard/del?id='+id, 
								type: 'DELETE',
								contentType: "application/json;charset=UTF-8",
								dataType: 'json',
								success: function(data){
									if(data.message == 'error'){
										alert("删除失败");
									}
									window.location.href = window.location.href;
								},error:function(xhr){
									alert('错误了，请重试');
								}
							});
				    }
			}
	</script> 	
</body>
</html>