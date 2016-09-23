<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>封禁账号</title>
	<style type="text/css">
		.error {
			color: Red;
		}
	</style>
</head>

<body>
	<script type="text/javascript" src="${ctx}/static/ckeditor/ckeditor.js"></script>
	<div class="page-header">
		<h4>封禁账号</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}
		</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/functionSeal/save" enctype="multipart/form-data">
		<div class="control-group">
			<label class="control-label" for="serverName">区服：</label>
			<div class="controls">
				<select id="serverName" name="serverName">	
					<option value="">请选择项目</option>
					<c:forEach items="${servers}" var="item" >
						<option value="${item.serverName}">
							${item.serverName}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="userId">玩家ID：</label>
			<div class="controls">
				<input type="text" id="userId" name="userId" class="input-large "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="userName">玩家名：</label>
			<div class="controls">
				<input type="text" id="userName" name="userName" class="input-large " readonly="readonly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="sealDayCount">封禁天数：</label>
			<div class="controls">
				<input type="text" name="sealDayCount" class="input-large "/>
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="causes">原因备注：</label>
			<div class="controls">
				<textarea path="text" id="causes" name="causes" cssClass="input-xlarge" value="" cols="100" rows="20" /></textarea>
			</div>
		</div>		
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
			<a href="<%=request.getContextPath()%>/manage/game/functionSeal/index" class="btn btn-primary">返回</a>
		</div>
	</form>
	<script type="text/javascript">
		CKEDITOR.replace('causes');
		$(function(){			
			$("#userId").blur(function(){
				var userId = $("#userId").val();
				$.ajax({
					url: '<%=request.getContextPath()%>/manage/game/functionSeal/findUserName?userId='+ userId,
					type : 'GET',
					contentType : "application/json;charset=UTF-8",
					dataType : 'text',
					success : function(data) {
						$("#userName").val(data);
					},
					error : function(xhr) {
						alert('错误了，请重试');
					}
				});
			});
			$("#inputForm").validate({
				rules:{
					serverName:{
						required:true
					},
					userId:{
						required:true
					},
					userName:{
						required:true
					},
					sealDayCount:{
						required:true,
						number:true
					}
				},messages:{
					serverName:{
						required:"区服必须填写"
					},
					userId:{
						required:"玩家ID必须填写"
					},
					userName:{
						required:"玩家名称必须填写，玩家ID可能不存在"
					},
					sealDayCount:{
						required:"配置值必须填写",
						number:"请输入数字"
					}
				}
			});
		})
	</script>
</body>