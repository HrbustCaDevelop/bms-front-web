<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.ca.bms.dto.SensorDTO"%>

<%
	response.addHeader("pragma", "no-cache");
	response.addHeader("cache-control", "no-cache,must-revalidate");
	response.addHeader("expires", "0");
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>楼宇防火监控主控制台</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="MobileOptimized" content="320">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="plugins/uniform/css/uniform.default.css" rel="stylesheet"
	type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="css/plugins.css" rel="stylesheet" type="text/css" />
<link href="css/themes/light.css" rel="stylesheet" type="text/css"
	id="style_color" />
<link href="css/custom.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->

			<a class="navbar-brand" href="index.html"> <img
				src="images/logo.png" alt="logo" class="img-responsive" />
			</a>

			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse"> <img
				src="images/menu-toggler.png" alt="" />
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-close-others="true"> <span class="username">欢迎您:
							${userdata.nickname}</span> <span class="username">个人中心</span> <i
						class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="password.bms"><i class="fa fa-user"></i>
								修改个人信息</a></li>
						<li><a href="javascript:;" id="trigger_fullscreen"><i
								class="fa fa-move"></i> 全屏显示</a></li>
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-key"></i> 注销退出</a></li>
					</ul></li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="start active "><a href="javascript:history.go(0)">
						<i class="fa fa-home"></i> <span class="title">控制面板</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="javascript:;"> <i class="fa fa-th"></i>
						<span class="title">实时数据</span> <span class="arrow "></span>
				</a><c:if test="${!empty mysensor}">
						<ul class="sub-menu">
							<c:forEach items="${mysensor}" var="sensor">
								<li><a href="realtime?serialnum=${sensor.serialNum}">${sensor.sensorType}</a></li>
							</c:forEach>
						</ul>
					</c:if></li>
				<li class=""><a href="javascript:;"> <i
						class="fa fa-bar-chart-o"></i> <span class="title">历史数据</span> <span
						class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="#">最近1个月</a></li>
						<li><a href="#">最近3个月</a></li>
						<li><a href="#">自定义时间查询</a></li>
					</ul></li>
				<li class=""><a href="javascript:;"> <i class="fa fa-cogs"></i>
						<span class="title">设备信息维护</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="#">新增托管设备</a></li>
						<li><a href="#">托管设备浏览</a></li>
					</ul></li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">欢迎使用楼宇防火监控数据平台</h3>
					<!-- END PAGE TITLE & BREADCRUMB-->
					<ul class="page-breadcrumb breadcrumb">
						<li><i class="fa fa-home"></i> <a href="#">首页</a>
							<i class="fa fa-angle-right"></i></li>
						<li><i class="fa fa-user"></i> <a href="#">用户设置</a> <i
							class="fa fa-angle-right"></i></li>
						<li><a href="#">个人信息修改</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">个人信息修改</h3>
						</div>
						<div class="panel-body">
<!-- 					<div class="alert alert-success">
								<button class="close" data-close="alert"></button>
								<strong>Success!</strong> 密码修改成功!
							</div>
							<div class="alert alert-danger">
								<button class="close" data-close="alert"></button>
								<strong>Error!</strong> 密码修改失败!
							</div> -->
							<form action="update" method="POST"
								class="form-horizontal">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									<span><strong>Warning!</strong> 新旧密码不一致，请核对后再提交！</span>
								</div>
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-3">昵称</label>
										<div class="col-md-4">
											<input type="text" name="nickname" id="nickname"
												class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">新密码<span
											class="required">*</span></label>
										<div class="col-md-4">
											<input type="password" class="form-control" name="pwd"
												id="pwd">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">确认新密码<span
											class="required">*</span></label>
										<div class="col-md-4">
											<input type="password" class="form-control" name="repassword"
												id="repassword">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">手机号码</label>
										<div class="col-md-4">
											<input type="text" name="phoneNum" id="phoneNum"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="form-actions fluid">
									<div class="col-md-offset-3 col-md-9">
										<button type="submit" class="btn red">
											<i class="fa fa-check"></i> 保存
										</button>
										<button type="button" class="btn default red-stripe">
											<i class="fa fa-edit"></i> 重置
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN DASHBOARD STATS -->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">2014 &copy; Alex</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
	<script src="plugins/respond.min.js"></script>
	<script src="plugins/excanvas.min.js"></script> 
	<![endif]-->
	<script src="plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script src="plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script src="plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="scripts/app.js" type="text/javascript"></script>
	<script src="scripts/backend-menu.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
		});
	</script>
	<script type="text/javascript">var webroot = "${ctx}";</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>