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
					<shiro:hasAnyRoles name="admin,systemUser,systemStore,systemWatcher">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,systemUser">
									<li><a href="${ctx}/manage/user/index">用户管理</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,systemStore">
									<li><a href="${ctx}/manage/store/index">门店管理</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin">
									<li><a href="${ctx}/manage/functions/index">权限管理</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,systemWatcher">
									<li><a href="${ctx}/manage/watcher/index">监控报警</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,summary">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">概况 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,summary">
									<li><a href="${ctx}/manage/game/summary/index">概况</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,playerNew,playActive,playerRetention,playerConvertion,playerChurned,playerBehavior,playerDivice">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">玩家 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,playerNew">
									<li><a href="${ctx}/manage/game/playerNew/index">新增玩家</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playActive">
									<li><a href="${ctx}/manage/game/playActive/index">活跃玩家</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playerRetention">
									<li><a href="${ctx}/manage/game/playerRetention/index">玩家留存</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playerConvertion">
									<li><a href="${ctx}/manage/game/playerConvertion/index">付费转换</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playerChurned">
									<li><a href="${ctx}/manage/game/playerChurned/index">玩家流失</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playerBehavior">
									<li><a href="${ctx}/manage/game/playerBehavior/index">玩家习惯</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,playerDivice">
									<li><a href="${ctx}/manage/game/playerDivice/index">设备相关</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,concurrent">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">在线分析 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,concurrent">
									<li><a href="${ctx}/manage/game/concurrent/index">在线分析</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,levelDetail,levelDistribute,levelSchedule">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">等级分析 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,levelDetail">
									<li><a href="${ctx}/manage/game/levelDetail/index">等级详情</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,levelDistribute">
									<li><a href="${ctx}/manage/game/levelDistribute/index">等级分布</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,levelSchedule">
									<li><a href="${ctx}/manage/game/levelSchedule/index">新玩家进度</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,tasks">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">任务分析 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,tasks">
									<li><a href="${ctx}/manage/game/tasks/index">任务和关卡</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,revenueIncomeDate,revenuePayPermeate,revenueNewPlayerValue,revenuePayHabit">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">收入分析 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,revenueIncomeDate">
									<li><a href="${ctx}/manage/game/revenueIncomeDate/index">收入数据</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,revenuePayPermeate">
									<li><a href="${ctx}/manage/game/revenuePayPermeate/index">付费渗透</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,revenueNewPlayerValue">
									<li><a href="${ctx}/manage/game/revenueNewPlayerValue/index">新玩家价值</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,revenuePayHabit">
									<li><a href="${ctx}/manage/game/revenuePayHabit/index">付费习惯</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,virtualEconomyVirtualCoin,virtualEconomyConsumeAnalysis,virtualEconomyConsumePoint">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">虚拟消费 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,virtualEconomyVirtualCoin">
									<li><a href="${ctx}/manage/game/virtualEconomyVirtualCoin/index">虚拟币</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,virtualEconomyConsumeAnalysis">
									<li><a href="${ctx}/manage/game/virtualEconomyConsumeAnalysis/index">消费喜好</a></li>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="admin,virtualEconomyConsumePoint">
									<li><a href="${ctx}/manage/game/virtualEconomyConsumePoint/index">消费点</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
							</ul>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="admin,whaleWhaleUser">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">鲸鱼用户 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<shiro:hasAnyRoles name="admin,whaleWhaleUser">
									<li><a href="${ctx}/manage/game/whaleWhaleUser/index">鲸鱼用户</a></li>
								</shiro:hasAnyRoles>
								<li class="divider"></li>
								<li><a href="#">sample</a></li>
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
								<li class="divider"></li>
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
