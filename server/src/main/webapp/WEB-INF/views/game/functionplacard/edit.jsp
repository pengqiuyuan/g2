<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>修改登录公告</title>
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
	<div class="page-header">
   		<h4>修改登录公告</h4>
 	</div>
 	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/functionPlacard/update"   enctype="multipart/form-data" >
			<input type="hidden" name="id" value="${functionPlacard.id}">
			<div
				class="control-group">
				<label class="control-label" for="title">标题（50字）：</label>
				<div class="controls">
					<input type="text" name="title" class="input-large "  placeholder="标题（50字）" value="${functionPlacard.title}"/>
				</div>
			</div>	
			<div class="control-group ">
				<label class="control-label" for="text">公告内容（1000字）：</label>
				<div class="controls">
					<textarea path="text" name="text" cssClass="input-xlarge" value="" style="height: 200px;width: 800px" />${functionPlacard.text}</textarea>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary" id="submit">保存</button>
				<a href="${ctx}/manage/game/functionPlacard/index" class="btn btn-primary">返回</a>
			</div>
	</form>
<script type="text/javascript">
	$(function(){
		$("#inputForm").validate({
			rules:{
				title:{
					required:true
				},
				text:{
					required:true
				}
			},messages:{
				title:{
					required:"标题必须填写"
				},
				text:{
					required:"内容必须填写"
				}
			}
		});			
		
	})
</script> 
</body>
