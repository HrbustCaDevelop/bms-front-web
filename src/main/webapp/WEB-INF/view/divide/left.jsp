<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->

			<!-- <a class="navbar-brand" href="#">
				<img src="images/logo.png" alt="logo" class="img-responsive" />
			</a> -->

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
						<li><a href="update.bms"><i
								class="fa fa-user"></i> 修改个人信息</a></li>
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
				</a> <c:if test="${!empty mysensor}">
						<ul class="sub-menu">
							<c:forEach items="${mysensor}" var="sensor">
								<li><a href="realtime.bms?id=${sensor.serialNum}">${sensor.sensorType}</a></li>
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
						<span class="title">设备管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="regsensor.bms">绑定设备</a></li>
						<li><a href="#">托管设备浏览</a></li>
					</ul></li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->