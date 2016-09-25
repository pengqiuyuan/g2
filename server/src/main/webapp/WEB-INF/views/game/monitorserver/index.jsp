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
<title>服务器状态设置</title>
	<style type="text/css">
		.form-ac {
		  padding: 19px 20px 20px;
		  margin-top: 20px;
		  margin-bottom: 20px;
		  padding-left: 180px;
		}
	</style>
</head>
<body>
	<div >
		<div class="page-header">
			<h4>服务器状态设置</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/monitorServer/index">
				<label>服务器状态：</label> 
					<select name="search_EQ_load">
						<option value="">---------请选择---------</option>
						<option value="0" ${param.search_EQ_load == '0' ? 'selected' : '' }>正常</option>
						<option value="1" ${param.search_EQ_load == '1' ? 'selected' : '' }>繁忙</option>
						<option value="2" ${param.search_EQ_load == '2' ? 'selected' : '' }>离线</option>
					</select> 
				<input type="submit" class="btn btn-default" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<form id="inputForm" method="post" Class="form-horizontal" action="<%=request.getContextPath()%>/manage/game/monitorServer/update"   enctype="multipart/form-data" >
			<div class="control-group">
				<table class="table table-striped table-bordered table-condensed" id="table">
					<thead>
						<tr>
							<th title="编号" width="120px">编号</th>
		                    <th title="serverName">服务器名称</th>
		                    <th title="load">状态</th>
							<th title="onlineUser">在线人数</th>
							<th title="totalUser">总玩家人数</th>
							<th title="ip">IP</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${monitorServers.content}" var="item" varStatus="s">
							<tr id="${item.id}">
								<td id="iDictionary" value="${item.id}">
									<div class="btn-group">
										<a class="btn" href="#">#${item.id}</a> 
										<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
									</div>
								</td>
								<td>${item.serverName}</td>
								<td>
									<c:choose>
										<c:when  test="${item.load eq '0'}">
											<span>正常</span>
										</c:when >
										<c:when  test="${item.load eq '1'}">
											<span>繁忙</span>
										</c:when >
										<c:when  test="${item.load eq '2'}">
											<span>离线</span>
										</c:when >
									</c:choose>
								</td>
								<td>${item.onlineUser}</td>
								<td>${item.totalUser}</td>
								<td>${item.ip}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<tags:pagination page="${monitorServers}" paginationSize="5"/>
			</div>
			<div class="control-group cStatus" style="display: none;"  >
				<label class="control-label">服务器状态：</label> 
				<div class="controls">	
					<select name="checkStatus">	
							<option value="0">正常</option>
							<option value="1">繁忙</option>
							<option value="2">离线</option>
					</select>	
				</div>			
			</div>
			<div class="form-actions cStatus" style="display: none;">
				<input type="submit" class="btn btn-primary" value="修改服务器信息" />
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$("#checkAll").click(function(){
	         var bischecked=$('#checkAll').is(':checked');
	         var f=$('input[class="checkbox" ]');
	         bischecked?f.prop('checked',true):f.prop('checked',false);
	         var m=$('.cStatus');
	         bischecked?m.show():m.hide();
		});
		$(".checkbox").click(function(){
	         var bischecked=$('.checkbox').is(':checked');
	         var m=$('.cStatus');
	         bischecked?m.show():m.hide();
		});
	</script> 	
</body>
</html>