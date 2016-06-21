<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>登录页</title>
</head>

<body>
	<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
		<fieldset>
			<legend>管理员登陆</legend>

	<%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){
	%>
		<div class="alert alert-error input-medium controls">
			<button class="close" data-dismiss="alert">×</button>登录失败，请重试.
		</div>
	<%
	}
	%>
		
		<div class="control-group">
			<label class="control-label" for="username">用户名：</label>
				<div class="controls">
					<input class="input-xlarge focused" name="username" id="username" type="text" value="">
					<span class="help-inline">请输入登录用户名.</span>
				</div>
		</div>		
		
		<div class="control-group">
			<label class="control-label" for="password">登录密码：</label>
			<div class="controls">
				<input class="input-xlarge" name="password" id="password" type="password" value="">
				<span class="help-inline">请输入登录密码.</span>
			</div>
		</div>	
		

	    <div class="control-group">
			<label class="control-label" for="j_captcha">验证码：</label>
			<div class="controls">
				<input class="input-xlarge" name="j_captcha" id="j_captcha" type="text" value="">
				<span class="help-inline">请输入验证码.</span></p></p>
				<div class="control-group"> 
					<img id="captchaImg" src="<c:url value="/jcaptcha.jpg"/>" /> 
				</div>
			</div>
		</div>
							
							<div class="control-group">
								<div class="controls">
									<input class="input-xlarge" name="_spring_security_remember_me" id="_spring_security_remember_me" type="checkbox" value="">
									两周内记住我
									<span style="margin-left: 25px">
										<a href="javascript:refreshCaptcha()">看不清楚换一张</a>    
                                    </span>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">确定登录</button>
							</div>
		</fieldset>
	</form>
</body>
</html>
