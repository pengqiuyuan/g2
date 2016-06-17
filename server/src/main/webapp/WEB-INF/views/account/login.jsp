<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>登录页</title>
<link href="${ctx}/static/hplus/css/plugins/iCheck/custom.css"  rel="stylesheet">
<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
<style type="text/css">
	.alert-danger {
	    color: #a94442;
	    background-color: #f3f3f4;
    	border-color: #f3f3f4;
	}
</style>
</head>

<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div class="m-b-md">
                <img alt="image" class="img-circle circle-border" src="${ctx}/static/hplus/img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">
            </div>
            <h3>管理员登陆</h3>
            <form class="m-t" role="form" id="loginForm" action="${ctx}/login" method="post">
                <%
					String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
					if(error != null){
					%>
						<div class="alert alert-danger alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            登录失败，请重试. 
                        </div>
						<%
					}
				%>
                <div class="form-group">
                    <input type="text" name="username" id="username" class="form-control" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="密码" >
                </div>
                <div class="form-group">
                    <input type="text" name="j_captcha" id="j_captcha" class="form-control" placeholder="请输入验证码">
                </div>
                <div class="form-group text-left">
               	    <a href="javascript:refreshCaptcha()"><img id="captchaImg" src="<c:url value="/jcaptcha.jpg"/>" /></a> 
                </div>
                <div class="form-group text-left">
                    <div class="checkbox i-checks">
                        <label class="no-padding">
                            <input name="_spring_security_remember_me" id="_spring_security_remember_me" type="checkbox" value="">两周内记住我
                        </label>    
                    </div>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            </form>
        </div>
    </div>
    
    <script src="${ctx}/static/hplus/js/plugins/iCheck/icheck.min.js" ></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
		function refreshCaptcha() {  
			 $('#captchaImg').hide().attr(  
      		'src',  
     			'<c:url value="/jcaptcha.jpg"/>' + '?' + Math  
              		.floor(Math.random() * 100)).fadeIn();  
	    }  
    </script>
</body>
</html>
