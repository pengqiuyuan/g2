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
	<title>礼品卡批次查询</title>
</head>
<body>
	<div>
		<div class="page-header">
			<h4>礼品卡批次查询</h4>
		</div>
		<div>
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>
			<form id="queryForm" class="well form-inline" method="get" action="${ctx}/manage/game/functionGiftCode/index">					
				<label>礼品码批次：</label> 
				<input name="search_EQ_giftNum" type="text" value="${param.search_EQ_giftNum}" placeholder="输入礼品码批次进行查询"/>
				<input type="submit" class="btn" value="查 找" />
				<tags:sort />
			</form>
		</div>
		<table class="table table-striped table-bordered table-condensed"
			id="table">
			<thead>
				<tr>
					<th title="编号" width="120px">编号</th>
					<th title="礼品码批次">礼品码批次</th>
					<th title="生成数量">生成数量</th>
					<th title="已使用数量">已使用数量</th>
					<th title="生效时间">生效时间</th>
					<th title="到期时间">到期时间</th>
					<th title="物品ID">物品ID</th>
					<th title="物品数量">物品数量</th>
					<th title="备注">备注</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${functionGiftCodes.content}" var="item" varStatus="s">
					<tr id="${item.id}">
						<td id="iDictionary" value="${item.id}">
							<div class="btn-group">
								<a class="btn" href="#">#${item.id}</a> 
							</div>
						</td>
						<td><a href="<%=request.getContextPath()%>/manage/game/functionGiftKey/index?search_EQ_giftNum=${item.giftNum}">${item.giftNum}</a></td>
						<td>${item.giftBuildNum}</td>
						<td>${item.giftUseNum}</td>
						<td>${item.startDate}</td>
						<td>${item.endDate}</td>
						<td>${item.itemId}</td>
						<td>${item.itemNum}</td>
						<td>
							<a href="#" class="intro" title="${item.notes}"> 
								<c:choose>
									<c:when test="${fn:length(item.notes)>100 }">
										<c:out value="${fn:substring(item.notes,0,100) }..." />
									</c:when>
									<c:otherwise>
										<c:out value="${item.notes }" />
									</c:otherwise>
								</c:choose>
							</a>
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
		$(function(){
			$('.intro').tooltip();
		});
	</script>
</body>
</html>