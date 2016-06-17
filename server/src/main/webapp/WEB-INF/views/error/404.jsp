<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>G2 后台主题 - 404 页面</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="http://www.zi-han.net/theme/hplus/favicon.ico" >
    <link href="${ctx}/static/hplus/css/bootstrap.min.css-v=3.3.5.css"  rel="stylesheet">
    <link href="${ctx}/static/hplus/css/font-awesome.min.css-v=4.4.0.css"  rel="stylesheet">
    <link href="${ctx}/static/hplus/css/animate.min.css"  rel="stylesheet">
    <link href="${ctx}/static/hplus/css/style.min.css-v=4.0.0.css"  rel="stylesheet">
    <script src="${ctx}/static/hplus/js/jquery.min.js-v=2.1.4.js" ></script>
    <script src="${ctx}/static/hplus/js/bootstrap.min.js-v=3.3.5.js" ></script>
    <script src="${ctx}/static/hplus/js/plugins/metisMenu/jquery.metisMenu.js" ></script>
    <script src="${ctx}/static/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js" ></script>
    <script src="${ctx}/static/hplus/js/plugins/layer/layer.min.js" ></script>
    <script src="${ctx}/static/hplus/js/hplus.min.js-v=4.0.0.js" ></script>
    <script type="text/javascript" src="${ctx}/static/hplus/js/contabs.min.js" ></script>
    <script src="${ctx}/static/hplus/js/plugins/pace/pace.min.js" ></script>
</head>

<body class="gray-bg">
    <div class="middle-box text-center animated fadeInDown">
        <h1>404</h1>
        <h3 class="font-bold">页面未找到！</h3>

        <div class="error-desc">
            抱歉，页面好像去火星了~
            <br/>您可以返回主页看看
            <br/><a href="index.html"  class="btn btn-primary m-t">主页</a>
        </div>
    </div>
</body>
</html>
