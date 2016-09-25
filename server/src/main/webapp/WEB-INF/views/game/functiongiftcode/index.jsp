<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<%@ page session="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>礼品卡查询</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>礼品卡查询</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/functionGiftCode/index">					
				<label>礼品码Id：</label> 
				<input name="search_EQ_giftId" type="text" value="${param.search_EQ_giftId}" placeholder="输入礼品码id进行查询"/>
				<input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="礼品码Id">礼品码Id</th>
					<th title="生成数量">生成数量</th>
					<th title="已使用数量">已使用数量</th>
					<th title="生效时间">生效时间</th>
					<th title="到期时间">到期时间</th>
					<th title="备注">备注</th>
					<th title="兑换物品">兑换物品</th>	
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${functionGiftCodes.content}" var="item" varStatus="s">
					<tr id="${item.id}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${item.id}</a> 
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#"><i class="icon-edit"></i>兑换物品</a></li>
									<li class="divider"></li>
								</ul>
							</div>
						</td>
						<td>${item.giftId}</td>
						<td>${item.giftBuildNum}</td>
						<td>${item.giftUseNum}</td>
						<td>${item.startDate}</td>
						<td>${item.endDate}</td>
						<td>${item.notes}</td>
						<td>
							<div class="action-buttons">
								<a class="exportCode btn table-actions" href="#" ><i class="icon-plus"></i>兑换物品</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<tags:pagination page="${functionGiftCodes}" paginationSize="5" />
		<div class="form-actions">
			<a href="<%=request.getContextPath()%>/manage/game/functionGiftCode/add" class="btn btn-primary">生成礼品码</a>
			<a href="<%=request.getContextPath()%>/manage/game/functionGiftCode/excel" class="btn btn-primary">导出excel</a>
		</div>
	</div>
	<script type="text/javascript">

	</script>
</body>
</html>