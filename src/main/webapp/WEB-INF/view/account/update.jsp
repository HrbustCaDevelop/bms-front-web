<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ca.bms.common.dto.SensorDTO"%>

<%@ include file="/WEB-INF/view/divide/header.jsp"%>

<script type="text/javascript">
	function updatemsg() {
		
		var re = /^1\d{10}$/
		if (updateMsg.phoneNum.value != "" && !re.test(updateMsg.phoneNum.value)) {
			$("#phoneFAIL").show();
			return;
		} else {
			$("#phoneFAIL").hide();
		}
		
		$("#updatecommit").hide();
		$.ajax({
		      type: "post",
		      url: "update",    
		      data: { nickname : updateMsg.nickname.value, password : updateMsg.password.value, phoneNum : updateMsg.phoneNum.value },
		      dataType: "json",
		      success : function(data){
		    	  $.each(data,function(){
		    			if (data.msg == 1) {
		    				$("#msgSUCC").show();
		    				$("#msgFAIL").hide();
		    				setTimeout("window.location='index.bms'",2000);
		    			}else {
		    				$("#updatecommit").show();
		    				$("#msgSUCC").hide();
		    				$("#msgFAIL").show();
		    			}
				  });
		      }
		});
	}
</script>

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
					<div id="phoneFAIL" class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						<span>请填写中国地区的手机号</span>
					</div>
			
					<div id="msgSUCC" class="alert alert-success display-hide">
						<button class="close" data-close="alert"></button>
						<strong>Success!</strong> 更新成功!跳转到登陆页
					</div>
					<div id="msgFAIL" class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						<strong>Error!</strong> 更新失败!
					</div>

					<form class="form-horizontal" name="updateMsg" id="updateMsg">
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
						<div id="updatecommit" class="form-actions fluid">
							<div class="col-md-offset-3 col-md-9">
								<button type="button" class="btn red" onclick="updatemsg()">
									<i class="fa fa-check"></i> 保存
								</button>
								<button type="reset" class="btn default red-stripe">
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

<%@ include file="/WEB-INF/view/divide/footer.jsp"%>

</body>
<!-- END BODY -->
</html>