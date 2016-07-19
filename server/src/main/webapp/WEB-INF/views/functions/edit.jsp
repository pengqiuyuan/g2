<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>修改功能权限</title>
	<style type="text/css"> 
	.error{ 
		color:Red; 
	} 
	</style> 
</head>

<body>
	<div class="page-header">
		<h4>修改功能权限</h4>
	</div>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/functions/update">
		<input type="hidden" name="id" value="${function.id}">
		<div class="control-group">
			<label class="control-label" for="firstName">一级名称：</label>
			<div class="controls">
				<input type="text" name="firstName" class="input-large " disabled="disabled" value="${function.firstName}" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="secondName">二级名称：</label>
			<div class="controls">
				<input type="text" name="secondName" class="input-large " disabled="disabled" value="${function.secondName}" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="role">功能权限：</label>
			<div class="controls">
				<input type="text" name="role" value="${function.role}"  class="input-large"  disabled="disabled"/>
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="status">操作员状态：</label>
			<div class="controls">
				<select name="status">
					<option value="1" ${user.status=='1'?'selected' : ''}>有效</option>
					<option value="0" ${user.status=='0'?'selected' : ''}>无效</option>
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