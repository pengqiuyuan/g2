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
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul></li>
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
