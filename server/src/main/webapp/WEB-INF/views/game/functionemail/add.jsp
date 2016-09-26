<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>邮件管理</title>
	<style type="text/css">
		.error {
			color: Red;
		}
	</style>
</head>

<body>
	<div class="page-header">
		<h4>邮件管理</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}
		</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/functionEmail/save" enctype="multipart/form-data">
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
		<div class="control-group" id="u">
		</div>
		<div class="control-group">
			<label class="control-label" for="title">邮件标题：</label>
			<div class="controls">
				<input type="text" name="title" class="input-large " />
			</div>
		</div>
		<div class="control-group ">
			<label class="control-label" for="text">广播内容（100字）：</label>
			<div class="controls">
				<textarea path="text" name="text" cssClass="input-xlarge" value="" style="height: 200px;width: 800px" /></textarea>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="attachmentID">物品ID：</label>
			<div class="controls">
				<input type="text" name="attachmentID" class="input-large " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="attachmentNum">数量：</label>
			<div class="controls">
				<input type="text" name="attachmentNum" class="input-large " />
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			$("#serverName").change(function(e){
				$("#u").empty();
				$("#userNameDiv").remove();
				if($("#serverName").val()=="全区全服"){
					$("#u").append("<label class='control-label' for='userId'>角色名：</label><div class='controls'><input type='text' id='userId' name='userId' class='input-large'  value='所有玩家' disabled='disabled'/></div>");
				}else {
					$("#u").append("<label class='control-label' for='userId'>玩家Id：</label><div class='controls'><input type='text' id='userId' name='userId' class='input-large'  value=''/></div>");
					$("#u").after("<div class='control-group' id='userNameDiv'><label class='control-label' for='userName'>玩家名：</label><div class='controls'><input type='text' id='userName' name='userName' class='input-large' value='' readonly='readonly'/></div></div>");
				}
				
				$("#userId").blur(function(){
					var userId = $("#userId").val();
					$.ajax({
						url: '<%=request.getContextPath()%>/manage/game/functionEmail/findUserName?userId='+ userId,
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
			});
			
			$("#inputForm").validate({
				rules:{
					title:{
						required:true
					}
				},messages:{
					title:{
						required:"邮件标题必须填写"
					}
				}
			});
		})
	</script>
</body>