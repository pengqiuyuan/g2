<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>
<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>消费点</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>消费点</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}</div>
			</c:if>
			<form id="inputForm"  Class="form-horizontal" >
				<div class="control-group">
					<label class="control-label" for="serverId">区服：</label>
					<div class="controls">
						<select id="serverId" name="search_EQ_serverId">	
							<option value="">请选择项目</option>
							<c:forEach items="${servers}" var="item" >
								<option value="${item.serverName}">
									${item.serverName}
								</option>
							</c:forEach>
						</select>
						<span id="error_storeId" class="error" hidden="hidden">项目必须填写</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="datetimepickerStart">起始时间：</label>
					<div class="controls">
						<div id="datetimepickerStart" class="input-append date">
							<input type="text" name="search_EQ_dateFrom" value="${param.search_EQ_dateFrom == null ? dateFrom : param.search_EQ_dateFrom }" id="dateFrom"></input> 
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateFrom" class="error" hidden="hidden">起始查询时间必须填写</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="datetimepickerEnd">结束时间：</label>
					<div class="controls">
						<div id="datetimepickerEnd" class="input-append date">
							<input type="text" name="search_EQ_dateTo" value="${param.search_EQ_dateTo == null ? dateTo : param.search_EQ_dateTo}" id="dateTo"></input>
							<span class="add-on"> 
								<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
							</span>
						</div>
						<span id="error_dateTo" class="error" hidden="hidden">结束查询时间必须填写</span>
						<span id="error_dateTo_vs_dateFrom" class="error" hidden="hidden">结束时间不能小于开始时间</span>
					</div>

				</div>
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">确定</span>
						</button>
						<a href="<%=request.getContextPath()%>/manage/store/index" class="btn btn-primary">返回</a>
					</div>
				</div>
				<tags:sort />
			</form>			
		</div>
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="项目">项目</th>
					<th title="价格">价格</th>
					<th title="购买次数" width="240px">购买次数</th>
					<th title="总金额">总金额</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${payPoints.content}" var="item" varStatus="s">
					<tr>
						<td>
							<div class="btn-group">
								<a class="btn" href="#">#${s.index+1}</a> <a
									class="btn dropdown-toggle" data-toggle="dropdown" href="#">
									<span class="caret"></span>
								</a>
							</div>
						</td>
						<td>${item.buyItem }</td>
						<td>${item.price}</td>
						<td>${item.buyCount}</td>
						<td>${item.amount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${payPoints}" paginationSize="5" />
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</body>
</html>