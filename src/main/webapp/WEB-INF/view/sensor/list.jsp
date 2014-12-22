<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ca.bms.common.dto.SensorDTO"%>

<%@ include file="/WEB-INF/view/divide/header.jsp"%>

<%@ include file="/WEB-INF/view/divide/left.jsp"%>

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
				<li><i class="fa fa-cogs"></i> <a href="#">设备管理</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="#">托管设备浏览</a></li>
			</ul>
			<form name="xsForm" method="post" class="form-horizontal">
				<!-- END PAGE TITLE & BREADCRUMB-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">托管设备浏览</h3>
					</div>
					<div class="panel-body">
						<div id="msgSUCC" class="alert alert-success">
							<button class="close" data-close="alert"></button>
							<strong>Success!</strong> 查询成功
						</div>
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">传感器序列号</label>
								<div class="col-md-4">
									<div class="input-icon">
										<i class="fa fa-user"></i> <input type="text" name="mc"
											class="form-control" placeholder="请输入需要查询的传感器序列号">
									</div>
								</div>
							</div>
						</div>
						<div class="form-actions top fluid">
							<div class="col-md-offset-3 col-md-9">
								<button type="submit" class="btn green" name="btnSearch">
									<i class="fa fa-check"></i> 查询
								</button>
								<button type="button" class="btn default green-stripe">
									<i class="fa fa-edit"></i> 重置
								</button>
							</div>
						</div>
						<div class="form-body">
							<table id="ec_table" border="0" cellspacing="0" cellpadding="0"
								class="table table-striped table-bordered table-advance table-hover"
								width="100%">
								<thead>
									<tr>
										<td>序列号</td>
										<td>位置</td>
										<td>传感器类型</td>
									</tr>
								</thead>

								<c:if test="${!empty mysensor}">
									<c:forEach items="${mysensor}" var="sensor">
										<tbody>
											<tr>
												<td>${sensor.serialNum}</td>
												<td>${sensor.sensoraddr}</td>
												<td>${sensor.sensorType}</td>
											</tr>
										</tbody>
									</c:forEach>
								</c:if>
							</table>
						</div>
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

<%@ include file="/WEB-INF/view/divide/footer.jsp"%>

</body>
<!-- END BODY -->
</html>