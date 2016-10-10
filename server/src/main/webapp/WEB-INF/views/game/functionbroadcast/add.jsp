<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>系统广播</title>
	<style type="text/css">
		.error {
			color: Red;
		}
	</style>
</head>

<body>

	<div class="page-header">
		<h4>系统广播</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}
		</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/functionBroadCast/save" enctype="multipart/form-data">
		<div class="control-group">
			<label class="control-label" for="serverName">区服：</label>
			<div class="controls">
				<select id="serverName" name="serverName">	
					<option value="">请选择项目</option>
					<option value="全区全服">全区全服</option>
					<c:forEach items="${servers}" var="item" >
						<option value="${item.serverName}">
							${item.serverName}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="text">广播内容（100字）：</label>
			<div class="controls">
				<textarea path="text" name="text" cssClass="input-xlarge" value="" style="height: 200px;width: 800px" /></textarea>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="interval">播放间隔（分钟）：</label>
			<div class="controls">
				<input type="text" name="interval" class="input-large " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="times">循环次数（-1无限）：</label>
			<div class="controls">
				<input type="text" name="times" class="input-large "/>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">修改提交</button>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			$("#inputForm").validate({
				rules:{
					serverName:{
						required:true
					},
					text:{
						required:true
					},
					interval:{
						required:true
					},
					times:{
						required:true
					}
				},messages:{
					serverName:{
						required:"区服必须填写"
					},
					text:{
						required:"广播内容必须填写"
					},
					interval:{
						required:"播放间隔必须填写"
					},
					times:{
						required:"循环次数必须填写"
					}
				}
			});
		})
	</script>
</body>