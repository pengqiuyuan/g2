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

			<div class="nav-collapse">
				<ul class="nav navbar-nav">
					<shiro:hasAnyRoles name="admin,summary">
						<li class="dropdown"><a href="${ctx}/manage/game/summary/index" class="dropdown-toggle" >首页 <b class="caret"></b></a>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,systemUser,systemStore,systemWatcher">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">后台设置 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,systemUser">
									<li><a href="${ctx}/manage/user/index">账号管理</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,systemLogger">
									<li><a href="${ctx}/manage/logger/index">操作记录</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin">
									<li><a href="${ctx}/manage/functions/index">权限管理</a></li>
								</shiro:hasAnyRoles>
								
								
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,functionGiftCode,functionPlacard,functionEmail,functionBroadCast,functionSeal">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">功能管理 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,functionGiftCode">
									<li><a href="${ctx}/manage/game/functionGiftCode/index">礼品码</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,functionPlacard">
									<li><a href="${ctx}/manage/game/functionPlacard/index">登录公告</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,functionEmail">
									<li><a href="${ctx}/manage/game/functionEmail/add">邮件管理</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,functionBroadCast">
									<li><a href="${ctx}/manage/game/functionBroadCast/add">系统广播</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,functionSeal">
									<li><a href="${ctx}/manage/game/functionSeal/index">黑名单管理</a></li>
								</shiro:hasAnyRoles>
								
								
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,monitorServer,monitorGameConfig,monitorIssues">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">信息监控 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,monitorServer">
									<li><a href="${ctx}/manage/game/monitorServer/index">服务器状态</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,monitorGameConfig">
									<li><a href="${ctx}/manage/game/monitorGameConfig/index">游戏配置</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,monitorIssues">
									<li><a href="${ctx}/manage/game/monitorIssues/index">意见反馈</a></li>
								</shiro:hasAnyRoles>
								
								
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,dataBasic,dataRetention,,dataRank,dataLevel,dataPayPoint,dataDiamond,dataMall">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">数据查询 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,dataBasic">
									<li><a href="${ctx}/manage/game/dataBasic/index">基本指标</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,dataRetention">
									<li><a href="${ctx}/manage/game/dataRetention/index">留存率</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,dataRank">
									<li><a href="${ctx}/manage/game/dataRank/index">等级分布</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,dataLevel">
									<li><a href="${ctx}/manage/game/dataLevel/index">关卡分布</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,dataPayPoint">
									<li><a href="${ctx}/manage/game/dataPayPoint/index">付费点</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,dataMall">
									<li><a href="${ctx}/manage/game/dataMall/index">商城消费</a></li>
								</shiro:hasAnyRoles>
								
							</ul>
						</li>
					</shiro:hasAnyRoles>
				</ul>
				<shiro:user>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="icon-user icon-white"></i>&nbsp;<shiro:principal
									property="name" /><b class="caret"></b></a>
							<ul class="dropdown-menu nav-list">
								<li><a href="${ctx}/profile">编辑个人资料</a></li>
								<li><a href="${ctx}/logout">安全退出</a></li>
							</ul></li>
					</ul>
				</shiro:user>
			</div>
			<!--/.nav-collapse -->

		</div>
	</div>
</div>
