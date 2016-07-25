<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>用户修改</title>
<style type="text/css">
.error {
	color: Red;
}
</style>
</head>

<body>
	<div class="page-header">
		<h4>用户修改</h4>
	</div>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/user/update">
		<input type="hidden" name="id" value="${user.id}">
		<div class="control-group">
			<label class="control-label" for="storeId">项目:</label>
			<div class="controls">
				<select name="storeId">
					<c:forEach items="${stores}" var="item">
						<option value="">请选择项目</option>
						<option value="${item.id }"
							${user.storeId == item.id ? "selected":"" }>${item.name }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="serverZone">运营大区：</label>
			<div class="controls">
				<c:forEach items="${serverZones}" var="ite" varStatus="j">
					<label class="checkbox inline"> 
						<input type="checkbox" class="box" name="serverZone" value="${ite.key.id}" id="serverZone_${ite.key.id}" ${ite.value=='包含'?'checked' : ''}/> <span>${ite.key.serverName}</span>
						<c:if test="${(j.index+1)%7 == 0}">
						</c:if>
					</label>
				</c:forEach>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">用户名:</label>
			<div class="controls">
				<input type="text" name="name" class="input-large " value="${user.name }" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="loginName">登入名:</label>
			<div class="controls">
				<input type="text" name="loginName" value="${user.loginName }" disabled='disabled' class="input-large" />
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="status">操作员状态:</label>
			<div class="controls">
				<select name="status">
					<option value="1" ${user.status=='1'?'selected' : ''}>有效</option>
					<option value="2" ${user.status=='2'?'selected' : ''}>冻结</option>
				</select>
			</div>
		</div>
		<div class="page-header">
			<span class="label">新增权限</span>
		</div>			
		<c:forEach items="${functions}" var="item" varStatus="i">
			<div class="control-group">
				<label class="control-label" onclick="selectAll(${i.index});">（点击全选）${item.key}：</label>
				<div class="controls">
					<c:forEach items="${item.value}" var="ite" varStatus="j">
						<label class="checkbox inline">
							<input type="checkbox" class="box" name="roles" value="${ite.key.role}" ${ite.value=='包含'?'checked' : ''} id="functions_${i.index}"/>
							<span>${ite.key.secondName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${(j.index+1)%7 == 0}">
							</c:if>
						</label>
					</c:forEach>	
				</div>
			</div>
		</c:forEach>		
		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
			<a href="<%=request.getContextPath()%>/manage/user/index"
				class="btn btn-primary">返回</a>
		</div>
	</form>
	<script type="text/javascript">
	function selectAll(id){  
	    if ($("#functions_"+id).prop("checked")) {
	        $("input[id='functions_"+id+"']").prop("checked", false);  
	    } else {  
	    	$("input[id='functions_"+id+"']").prop("checked", true);  
	    }  
	}	
		$(function() {
			$("#inputForm").validate({
				rules : {
					storeId : {
						required : true
					},
					serverZone : {
						required : true
					},
					name : {
						required : true,
						minlength : 2,
						maxlength : 10
					},
					loginName : {
						required : true,
						minlength : 2,
						maxlength : 10
					},
					pwdCipher : {
						required : true,
						minlength : 5,
						maxlength : 15
					},
					confirmPwdCipher : {
						required : true,
						minlength : 5,
						maxlength : 15,
						equalTo : "#pwdCipher"
					}
				},
				messages : {
					storeId : {
						required : "项目必须填写"
					},
					serverZone : {
						required : "运营大区必须填写"
					},
					name : {
						required : "必须填写",
						minlength : "用户名长度2-10位"
					},
					loginName : {
						required : "必须填写",
						minlength : "登入名长度2-10位"
					},
					pwdCipher : {
						required : "必须填写",
						minlength : "密码长度5-15位",
						maxlength : "密码长度5-15位"
					},
					confirmPwdCipher : {
						required : "必须填写",
						minlength : "密码长度5-15位",
						maxlength : "密码长度5-15位",
						equalTo : "两次输入密码不一致，请重新输入"
					}
				}
			});
		})
	</script>
</body>