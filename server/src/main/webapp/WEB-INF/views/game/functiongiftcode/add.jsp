<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>生成礼品码</title>
	<style type="text/css">
		.error {
			color: Red;
		}
	</style>
	<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.css">
</head>

<body>
	<div class="page-header">
		<h4>生成礼品码</h4>
	</div>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}
		</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/game/functionGiftCode/save" enctype="multipart/form-data">
		<div class="control-group">
			<label class="control-label" for="giftBuildNum">生成数量：</label>
			<div class="controls">
				<input type="text" name="giftBuildNum" class="input-large " />
			</div>
		</div>
		
				<div class="control-group">
					<label class="control-label" for="datetimepickerStart">生效时间：</label>
					<div class="controls">
						<div id="datetimepickerStart" class="input-append date">
							<input type="text" name="startDate" id="startDate"></input> 
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateFrom" class="error" hidden="hidden">生效时间时间必须填写</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="datetimepickerEnd">结束时间：</label>
					<div class="controls">
						<div id="datetimepickerEnd" class="input-append date">
							<input type="text" name="endDate" id="endDate"></input>
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateTo" class="error" hidden="hidden">结束查询时间必须填写</span>
						<span id="error_dateTo_vs_dateFrom" class="error" hidden="hidden">结束时间不能小于生效时间</span>
					</div>
				</div>	
		<div class="control-group">
			<label class="control-label" for="notes">作用备注：</label>
			<div class="controls">
				<input type="text" name="notes" class="input-large " />
			</div>
		</div>			
		<div class="control-group">
			<label class="control-label" for="itemId">物品ID：</label>
			<div class="controls">
				<input type="text" name="itemId" class="input-large " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="itemNum">数量：</label>
			<div class="controls">
				<input type="text" name="itemNum" class="input-large " />
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary" id="submit">保存</button>
			<a href="<%=request.getContextPath()%>/manage/game/functionGiftCode/index" class="btn btn-primary">返回</a>
		</div>
	</form>
	<script type="text/javascript" src="${ctx}/static/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		$('#datetimepickerStart').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : true,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});
		$('#datetimepickerEnd').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'en',
			pickDate : true,
			pickTime : true,
			hourStep : 1,
			minuteStep : 15,
			secondStep : 30,
			inputMask : true
		});

		$(function(){
			$("#inputForm").validate({
				rules:{
					giftBuildNum:{
						required:true
					},
					notes:{
						required:true
					},
					itemId:{
						required:true
					},
					itemNum:{
						required:true
					}
				},messages:{
					giftBuildNum:{
						required:"生成数量必须填写"
					},
					notes:{
						required:"备注必须填写"
					},
					itemId:{
						required:"物品Id必须填写"
					},
					itemNum:{
						required:"物品数量必须填写"
					}
				}
			});
		})
	</script>
</body>