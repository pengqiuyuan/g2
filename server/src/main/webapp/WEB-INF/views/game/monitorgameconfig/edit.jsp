<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>修改服务器配置</title>
	<style type="text/css">
		.error {
			color: Red;
		}
	</style>
</head>
<body>
	<div class="page-header">
		<h4>修改服务器配置</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/monitorGameConfig/update" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${monitorGameConfig.id}">
		<div class="control-group">
			<label class="control-label" for="configKey">配置项：</label>
			<div class="controls">
				<input type="text" name="configKey" class="input-large " value="${monitorGameConfig.configKey}" readonly="readonly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="configValue">配置值：</label>
			<div class="controls">
				<input type="text" name="configValue" class="input-large " value="${monitorGameConfig.configValue}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="nodes">作用备注：</label>
			<div class="controls">
				<input type="text" name="nodes" class="input-large " value="${monitorGameConfig.nodes}"/>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
			<a href="<%=request.getContextPath()%>/manage/game/monitorGameConfig/index" class="btn btn-primary">返回</a>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			$("#inputForm").validate({
				rules:{
					nodes:{
						required:true
					},
					configValue:{
						required:true
					},
					configKey:{
						required:true,
						minlength:1,
						maxlength:7
					}
				},messages:{
					nodes:{
						required:"作用备注必须填写"
					},
					configValue:{
						required:"配置值必须填写"
					},
					configKey:{
						required:"配置项必须填写"
					}
				}
			});
		})
	</script>
</body>