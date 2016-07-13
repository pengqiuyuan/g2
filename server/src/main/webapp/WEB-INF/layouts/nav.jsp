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
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/user/index">用户管理</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/store/index">门店管理</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/authority/index">权限管理</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">游戏概况 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/summary/index">游戏概况</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">游戏玩家 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerNew/index">新增玩家</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playActive/index">活跃玩家</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerRetention/index">玩家留存</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerConvertion/index">付费转换</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerChurned/index">玩家流失</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerBehavior/index">游戏习惯</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/playerDivice/index">设备相关</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">在线分析 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/concurrent/index">在线分析</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">等级分析 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/levelDetail/index">等级详情</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/levelDistribute/index">等级分布</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/levelSchedule/index">新玩家进度</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">任务分析 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/tasks/index">任务和关卡</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">收入分析 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/revenueIncomeDate/index">收入数据</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/revenuePayPermeate/index">付费渗透</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/revenueNewPlayerValue/index">新玩家价值</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/revenuePayHabit/index">付费习惯</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">虚拟消费 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/virtualEconomyVirtualCoin/index">虚拟币</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/virtualEconomyConsumeAnalysis/index">消费喜好</a></li>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/virtualEconomyConsumePoint/index">消费点</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">鲸鱼用户 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<shiro:hasAnyRoles name="admin">
								<li><a href="${ctx}/manage/whaleWhaleUser/index">鲸鱼用户</a></li>
							</shiro:hasAnyRoles>
							<li class="divider"></li>
							<li><a href="#">sample</a></li>
						</ul>
					</li>
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
