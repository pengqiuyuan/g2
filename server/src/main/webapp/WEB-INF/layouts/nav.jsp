<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container" style="margin-left: 40px;width: auto;">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>

            <shiro:hasAnyRoles name='admin,business,store_admin,store_business'>
			<div class="nav-collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">系统管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
					     	<!-- 总店管理员，分店管理员 -->
							<shiro:hasAnyRoles name="admin,store_admin">
								<li><a href="${ctx}/manage/user/index">用户管理</a></li>
							</shiro:hasAnyRoles>
							<!-- 总店管理员，总店业务员，分店管理员 -->
							<shiro:hasAnyRoles name="admin,store_admin,business">
							<li><a href="${ctx}/manage/store/index">门店管理</a></li>
							<li><a href="${ctx}/manage/floor/index">门店楼层管理</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin,business">
							<li><a href="${ctx}/manage/baiduPush/addPush">百度推送</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
							<li><a href="${ctx}/manage/apps/version/index">版本管理</a></li>
							</shiro:hasAnyRoles>
							<li><a href="${ctx}/manage/feeBack/index">意见反馈管理</a></li>
							<shiro:hasAnyRoles name="admin,business">
							<li><a href="${ctx}/manage/log/index">日志管理</a></li>
							<li><a href="${ctx}/manage/advertise/index">招聘管理</a></li>
							<li><a href="${ctx}/manage/supplier/index">供应商管理</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">商品管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/manage/coupon/index?search_EQ_type=1&search_NEQ_type=3">卡劵管理</a></li>
							<li><a href="${ctx}/manage/product/index">商品管理</a></li>
							<!-- 总店管理员，总店业务员 -->
							<shiro:hasAnyRoles name="admin,business">
							<li><a href="${ctx}/manage/category/index?search_EQ_ref=0">分类管理</a></li>
							<li><a href="${ctx}/manage/tags/index">标签管理</a></li>
							<li><a href="${ctx}/manage/brands/index">品牌管理</a></li>
							</shiro:hasAnyRoles>
						    <li><a href="${ctx}/manage/themes/index">主题管理</a></li>
							<li><a href="${ctx}/manage/activity/index">活动管理</a></li>
							<!-- <li><a href="${ctx}/manage/counters/index">专柜管理</a></li> -->
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">会员管理<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/manage/member/index">会员信息</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">订单管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/manage/orders/index?search_EQ_orderType=1">订单管理</a></li>
							<li><a href="${ctx}/manage/orderStores/index">自提管理</a></li>
						</ul></li>
						
                  <shiro:hasAnyRoles name="admin,store_admin">
                 
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">统计分析<b class="caret"></b></a>
						<ul class="dropdown-menu">
						
							<li><a href="${ctx}/manage/count/order">订单统计</a></li>
							<li><a href="${ctx}/manage/count/role">后台用户统计</a></li>
							<li><a href="${ctx}/manage/count/member">app用户统计</a></li>
						
						</ul></li>
						
				 </shiro:hasAnyRoles>
				   <shiro:hasAnyRoles name="admin">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">参数设置<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${ctx}/manage/config/freight">运费设置</a></li>							
							<li><a href="${ctx}/manage/config/timing">订单过期时间设置</a></li>
							<li><a href="${ctx}/manage/config/mt">短信接口</a></li>
						</ul></li>
				 </shiro:hasAnyRoles>
				</ul>
				<shiro:user>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="icon-user icon-white"></i>&nbsp;<shiro:principal
									property="name" /><b class="caret"></b></a>
							<ul class="dropdown-menu nav-list">
								<li class="divider"></li>
								<li><a href="${ctx}/profile">编辑个人资料</a></li>
								<li><a href="${ctx}/logout">安全退出</a></li>
							</ul></li>
					</ul>
				</shiro:user>
			</div>
				</shiro:hasAnyRoles>
			
			<!--/.nav-collapse -->

		</div>
	</div>
</div>
