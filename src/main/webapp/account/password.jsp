<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ca.bms.dto.SensorDTO"%>

<%@ include file="/divide/header.jsp"%>

<%@ include file="/divide/left.jsp"%>

<!--  BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<h3 class="page-title">欢迎使用楼宇防火监控数据平台</h3>
			<!-- END PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="fa fa-home"></i> <a href="#">首页</a> <i
					class="fa fa-angle-right"></i></li>
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
					<form action="update" method="POST" class="form-horizontal">
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
									<input type="password" class="form-control" name="password"
										id="password">
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

<%@ include file="/divide/footer.jsp"%>

</body>
<!-- END BODY -->
</html>