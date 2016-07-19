<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>新增功能权限</title>
	<style type="text/css"> 
		.error{ 
		color:Red; 
		} 
	</style> 
</head>
<body>
	<div class="page-header">
		<h4>新增功能权限</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}
		</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/functions/save">
		<div class="control-group">
			<label class="control-label">一级名称：</label>
			<div class="controls">
				<select id="firstName" name="firstName" class="province-select">
					<option value="">请选择一级名称</option>
					<c:forEach items = "${firstNa}" var="first">
						<option  value="${first}">${first}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="secondName">二级名称：</label>
			<div class="controls">
				<input type="text" name="secondName" class="input-large " value="" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="role">功能权限：</label>
			<div class="controls">
				<input type="text" name="role" value="" class="input-large"  placeholder=""/>
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="status">操作员状态：</label>
			<div class="controls">
				<select name="status">
					<option value="1">有效</option>
					<option value="0">无效</option>
				</select>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
			<a href="<%=request.getContextPath()%>/manage/functions/index" class="btn btn-primary">返回</a>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			$("#inputForm").validate({
				rules : {
					firstName : {
						required : true
					},
					secondName : {
						required : true,
						remote: "${ctx}/manage/functions/checkSecondName"
					},
					role : {
						required : true,
						remote: "${ctx}/manage/functions/checkRole"
					}
				},
				messages : {
					firstName : {
						required : "必须填写"
					},
					secondName : {
						required : "必须填写",
						remote: "功能二级名称已存在"
					},
					role : {
						required : "必须填写",
						remote: "权限已存在"
					}
				}
			});
		})
	</script>
</body>