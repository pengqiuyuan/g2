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
		
		<form id="inputForm" method="post" Class="form-horizontal" action="<%=request.getContextPath()%>/manage/game/monitorServer/update"   enctype="multipart/form-data" >
			<div class="control-group">
				<table class="table table-striped table-bordered table-condensed" id="table">
					<thead>
						<tr>
							<th class="check-header hidden-xs">
		                      <label><input id="checkAll" name="checkAll" type="checkbox"><span></span></label>
		                    </th>
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
								<td><label><input  type="checkbox" class="checkbox" name="checkId" value="${item.serverId}"><span></span></label></td>
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
		         var f=$('input[class="checkbox"]');
		         bischecked?f.attr('checked',true):f.attr('checked',false);
		         var m=$('.cStatus');
		         bischecked?m.show():m.hide();
			});
			$(".checkbox").click(function(){
		         var bischecked=$('.checkbox').is(':checked');
		         var m=$('.cStatus');
		         bischecked?m.show():m.hide();
			});
			$("#queryForm").validate({
				rules:{
					search_EQ_storeId:{
						required:true
					},
					search_EQ_serverZoneId:{
						required:true
					}
				},messages:{
					search_EQ_storeId:{
						required:"游戏项目"
					},
					search_EQ_serverZoneId:{
						required:"运营必须填写"
					}
				}
			});	
		</script> 	
</body>
</html>