<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<shiro:hasAnyRoles name='admin'>
    <div id="wrapper">
        <!--左侧导航开始-->

        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${ctx}/static/hplus/img/profile_small.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="form_avatar.html" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html" tppabs="http://www.zi-han.net/theme/hplus/contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html" tppabs="http://www.zi-han.net/theme/hplus/mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${ctx}/logout" >安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index_v1.html" tppabs="http://www.zi-han.net/theme/hplus/index_v1.html" data-index="0">主页示例一</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v2.html" tppabs="http://www.zi-han.net/theme/hplus/index_v2.html">主页示例二</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v3.html" tppabs="http://www.zi-han.net/theme/hplus/index_v3.html">主页示例三</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v4.html" tppabs="http://www.zi-han.net/theme/hplus/index_v4.html">主页示例四</a>
                            </li>
                            <li>
                                <a href="index_v5.html" tppabs="http://www.zi-han.net/theme/hplus/index_v5.html" target="_blank">主页示例五</a>
                            </li>
                        </ul>

                    </li>
                    <li>
                        <a class="J_menuItem" href="layouts.html" tppabs="http://www.zi-han.net/theme/hplus/layouts.html"><i class="fa fa-columns"></i> <span class="nav-label">布局</span></a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="graph_echarts.html" tppabs="http://www.zi-han.net/theme/hplus/graph_echarts.html">百度ECharts</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_flot.html" tppabs="http://www.zi-han.net/theme/hplus/graph_flot.html">Flot</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_morris.html" tppabs="http://www.zi-han.net/theme/hplus/graph_morris.html">Morris.js</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_rickshaw.html" tppabs="http://www.zi-han.net/theme/hplus/graph_rickshaw.html">Rickshaw</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_peity.html" tppabs="http://www.zi-han.net/theme/hplus/graph_peity.html">Peity</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_sparkline.html" tppabs="http://www.zi-han.net/theme/hplus/graph_sparkline.html">Sparkline</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_metrics.html" tppabs="http://www.zi-han.net/theme/hplus/graph_metrics.html">图表组合</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="mailbox.html" tppabs="http://www.zi-han.net/theme/hplus/mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="mailbox.html" tppabs="http://www.zi-han.net/theme/hplus/mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_detail.html" tppabs="http://www.zi-han.net/theme/hplus/mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="mail_compose.html" tppabs="http://www.zi-han.net/theme/hplus/mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="form_basic.html" tppabs="http://www.zi-han.net/theme/hplus/form_basic.html">基本表单</a>
                            </li>
                            <li><a class="J_menuItem" href="form_validate.html" tppabs="http://www.zi-han.net/theme/hplus/form_validate.html">表单验证</a>
                            </li>
                            <li><a class="J_menuItem" href="form_advanced.html" tppabs="http://www.zi-han.net/theme/hplus/form_advanced.html">高级插件</a>
                            </li>
                            <li><a class="J_menuItem" href="form_wizard.html" tppabs="http://www.zi-han.net/theme/hplus/form_wizard.html">表单向导</a>
                            </li>
                            <li>
                                <a href="#">文件上传 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_webuploader.html" tppabs="http://www.zi-han.net/theme/hplus/form_webuploader.html">百度WebUploader</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_file_upload.html" tppabs="http://www.zi-han.net/theme/hplus/form_file_upload.html">DropzoneJS</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_avatar.html" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">头像裁剪上传</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">编辑器 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_editors.html" tppabs="http://www.zi-han.net/theme/hplus/form_editors.html">富文本编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_simditor.html" tppabs="http://www.zi-han.net/theme/hplus/form_simditor.html">simditor</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_markdown.html" tppabs="http://www.zi-han.net/theme/hplus/form_markdown.html">MarkDown编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="code_editor.html" tppabs="http://www.zi-han.net/theme/hplus/code_editor.html">代码编辑器</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="suggest.html" tppabs="http://www.zi-han.net/theme/hplus/suggest.html">搜索自动补全</a>
                            </li>
                            <li><a class="J_menuItem" href="layerdate.html" tppabs="http://www.zi-han.net/theme/hplus/layerdate.html">日期选择器layerDate</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="contacts.html" tppabs="http://www.zi-han.net/theme/hplus/contacts.html">联系人</a>
                            </li>
                            <li><a class="J_menuItem" href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">个人资料</a>
                            </li>
                            <li>
                                <a href="#">项目管理 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="projects.html" tppabs="http://www.zi-han.net/theme/hplus/projects.html">项目</a>
                                    </li>
                                    <li><a class="J_menuItem" href="project_detail.html" tppabs="http://www.zi-han.net/theme/hplus/project_detail.html">项目详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="teams_board.html" tppabs="http://www.zi-han.net/theme/hplus/teams_board.html">团队管理</a>
                            </li>
                            <li><a class="J_menuItem" href="social_feed.html" tppabs="http://www.zi-han.net/theme/hplus/social_feed.html">信息流</a>
                            </li>
                            <li><a class="J_menuItem" href="clients.html" tppabs="http://www.zi-han.net/theme/hplus/clients.html">客户管理</a>
                            </li>
                            <li><a class="J_menuItem" href="file_manager.html" tppabs="http://www.zi-han.net/theme/hplus/file_manager.html">文件管理器</a>
                            </li>
                            <li><a class="J_menuItem" href="calendar.html" tppabs="http://www.zi-han.net/theme/hplus/calendar.html">日历</a>
                            </li>
                            <li>
                                <a href="#">博客 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="blog.html" tppabs="http://www.zi-han.net/theme/hplus/blog.html">文章列表</a>
                                    </li>
                                    <li><a class="J_menuItem" href="article.html" tppabs="http://www.zi-han.net/theme/hplus/article.html">文章详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="faq.html" tppabs="http://www.zi-han.net/theme/hplus/faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="#">时间轴 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="timeline.html" tppabs="http://www.zi-han.net/theme/hplus/timeline.html">时间轴</a>
                                    </li>
                                    <li><a class="J_menuItem" href="timeline_v2.html" tppabs="http://www.zi-han.net/theme/hplus/timeline_v2.html">时间轴v2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="pin_board.html" tppabs="http://www.zi-han.net/theme/hplus/pin_board.html">标签墙</a>
                            </li>
                            <li>
                                <a href="#">单据 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="invoice.html" tppabs="http://www.zi-han.net/theme/hplus/invoice.html">单据</a>
                                    </li>
                                    <li><a class="J_menuItem" href="invoice_print.html" tppabs="http://www.zi-han.net/theme/hplus/invoice_print.html">单据打印</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="search_results.html" tppabs="http://www.zi-han.net/theme/hplus/search_results.html">搜索结果</a>
                            </li>
                            <li><a class="J_menuItem" href="forum_main.html" tppabs="http://www.zi-han.net/theme/hplus/forum_main.html">论坛</a>
                            </li>
                            <li>
                                <a href="#">即时通讯 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="chat_view.html" tppabs="http://www.zi-han.net/theme/hplus/chat_view.html">聊天窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="webim.html" tppabs="http://www.zi-han.net/theme/hplus/webim.html">layIM</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">登录注册相关 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a href="login.html" tppabs="http://www.zi-han.net/theme/hplus/login.html" target="_blank">登录页面</a>
                                    </li>
                                    <li><a href="login_v2.html" tppabs="http://www.zi-han.net/theme/hplus/login_v2.html" target="_blank">登录页面v2</a>
                                    </li>
                                    <li><a href="register.html" tppabs="http://www.zi-han.net/theme/hplus/register.html" target="_blank">注册页面</a>
                                    </li>
                                    <li><a href="lockscreen.html" tppabs="http://www.zi-han.net/theme/hplus/lockscreen.html" target="_blank">登录超时</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="404.html" tppabs="http://www.zi-han.net/theme/hplus/404.html">404页面</a>
                            </li>
                            <li><a class="J_menuItem" href="500.html" tppabs="http://www.zi-han.net/theme/hplus/500.html">500页面</a>
                            </li>
                            <li><a class="J_menuItem" href="empty_page.html" tppabs="http://www.zi-han.net/theme/hplus/empty_page.html">空白页</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="typography.html" tppabs="http://www.zi-han.net/theme/hplus/typography.html">排版</a>
                            </li>
                            <li>
                                <a href="#">字体图标 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a class="J_menuItem" href="fontawesome.html" tppabs="http://www.zi-han.net/theme/hplus/fontawesome.html">Font Awesome</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="glyphicons.html" tppabs="http://www.zi-han.net/theme/hplus/glyphicons.html">Glyphicon</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="iconfont.html" tppabs="http://www.zi-han.net/theme/hplus/iconfont.html">阿里巴巴矢量图标库</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">拖动排序 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="draggable_panels.html" tppabs="http://www.zi-han.net/theme/hplus/draggable_panels.html">拖动面板</a>
                                    </li>
                                    <li><a class="J_menuItem" href="agile_board.html" tppabs="http://www.zi-han.net/theme/hplus/agile_board.html">任务清单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="buttons.html" tppabs="http://www.zi-han.net/theme/hplus/buttons.html">按钮</a>
                            </li>
                            <li><a class="J_menuItem" href="tabs_panels.html" tppabs="http://www.zi-han.net/theme/hplus/tabs_panels.html">选项卡 &amp; 面板</a>
                            </li>
                            <li><a class="J_menuItem" href="notifications.html" tppabs="http://www.zi-han.net/theme/hplus/notifications.html">通知 &amp; 提示</a>
                            </li>
                            <li><a class="J_menuItem" href="badges_labels.html" tppabs="http://www.zi-han.net/theme/hplus/badges_labels.html">徽章，标签，进度条</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="grid_options.html" tppabs="http://www.zi-han.net/theme/hplus/grid_options.html">栅格</a>
                            </li>
                            <li><a class="J_menuItem" href="plyr.html" tppabs="http://www.zi-han.net/theme/hplus/plyr.html">视频、音频</a>
                            </li>
                            <li>
                                <a href="#">弹框插件 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="layer.html" tppabs="http://www.zi-han.net/theme/hplus/layer.html">Web弹层组件layer</a>
                                    </li>
                                    <li><a class="J_menuItem" href="modal_window.html" tppabs="http://www.zi-han.net/theme/hplus/modal_window.html">模态窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="sweetalert.html" tppabs="http://www.zi-han.net/theme/hplus/sweetalert.html">SweetAlert</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">树形视图 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="jstree.html" tppabs="http://www.zi-han.net/theme/hplus/jstree.html">jsTree</a>
                                    </li>
                                    <li><a class="J_menuItem" href="tree_view.html" tppabs="http://www.zi-han.net/theme/hplus/tree_view.html">Bootstrap Tree View</a>
                                    </li>
                                    <li><a class="J_menuItem" href="nestable_list.html" tppabs="http://www.zi-han.net/theme/hplus/nestable_list.html">nestable</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="toastr_notifications.html" tppabs="http://www.zi-han.net/theme/hplus/toastr_notifications.html">Toastr通知</a>
                            </li>
                            <li><a class="J_menuItem" href="diff.html" tppabs="http://www.zi-han.net/theme/hplus/diff.html">文本对比</a>
                            </li>
                            <li><a class="J_menuItem" href="spinners.html" tppabs="http://www.zi-han.net/theme/hplus/spinners.html">加载动画</a>
                            </li>
                            <li><a class="J_menuItem" href="widgets.html" tppabs="http://www.zi-han.net/theme/hplus/widgets.html">小部件</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="table_basic.html" tppabs="http://www.zi-han.net/theme/hplus/table_basic.html">基本表格</a>
                            </li>
                            <li><a class="J_menuItem" href="table_data_tables.html" tppabs="http://www.zi-han.net/theme/hplus/table_data_tables.html">DataTables</a>
                            </li>
                            <li><a class="J_menuItem" href="table_jqgrid.html" tppabs="http://www.zi-han.net/theme/hplus/table_jqgrid.html">jqGrid</a>
                            </li>
                            <li><a class="J_menuItem" href="table_foo_table.html" tppabs="http://www.zi-han.net/theme/hplus/table_foo_table.html">Foo Tables</a>
                            </li>
                            <li><a class="J_menuItem" href="table_bootstrap.html" tppabs="http://www.zi-han.net/theme/hplus/table_bootstrap.html">Bootstrap Table
                                <span class="label label-danger pull-right">推荐</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="basic_gallery.html" tppabs="http://www.zi-han.net/theme/hplus/basic_gallery.html">基本图库</a>
                            </li>
                            <li><a class="J_menuItem" href="carousel.html" tppabs="http://www.zi-han.net/theme/hplus/carousel.html">图片切换</a>
                            </li>
                            <li><a class="J_menuItem" href="layerphotos.html" tppabs="http://www.zi-han.net/theme/hplus/layerphotos.html">layer相册</a>
                            </li>
                            <li><a class="J_menuItem" href="blueimp.html" tppabs="http://www.zi-han.net/theme/hplus/blueimp.html">Blueimp相册</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="J_menuItem" href="css_animation.html" tppabs="http://www.zi-han.net/theme/hplus/css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-cutlery"></i> <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="form_builder.html" tppabs="http://www.zi-han.net/theme/hplus/form_builder.html">表单构建器</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
            </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index_v1.html-v=4.0.htm" tppabs="http://www.zi-han.net/theme/hplus/index_v1.html?v=4.0" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="javascript:if(confirm(%27http://www.zi-han.net/  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.zi-han.net/%27" tppabs="http://www.zi-han.net/" target="_blank">zihan's blog</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->

    </div>
</shiro:hasAnyRoles>