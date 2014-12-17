<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ca.bms.dto.SensorDTO"%>

<%@ include file="/WEB-INF/view/divide/header.jsp"%>

<script type="text/javascript">
	function regsensor() {
		if (regform.serialnum.value == "") {
			$("#paramInvide").show();
			return;
		}
		
		$("#paramInvide").hide();
		$("#regcommit").hide();
		
		$.ajax({
		      type: "post",
		      url: "regsensor",    
		      data: { serialnum : regform.serialnum.value },
		      dataType: "json",
		      success : function(data){
		    	  if (data.msg == 1) {
		    		  $("#msgFAIL").hide();
		    		  $("#msgSUCC").show();
		    		  $("#regcommit").show();
		    		  setTimeout("$(\"#msgSUCC\").hide();",5000);
		    	  } else {
		    		  $("#msgFAIL").show();
		    		  $("#reason").show();
		    		  $("#msgFAIL").html(" <strong>Error!</strong> 绑定失败! 因为：" + data.reason);
		    		  $("#regcommit").show();
		    		  $("#msgSUCC").hide();
		    		  setTimeout("$(\"#msgFAIL\").hide();",5000);
		    	  }
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
				<li><i class="fa fa-cogs"></i> <a href="#">设备管理</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="#">绑定设备</a></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">关联设备到账户</h3>
				</div>
				<div class="panel-body">
					
					<div id="paramInvide" class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						<strong>Error!</strong> 请填写序列号！
					</div>
					<div id="msgSUCC" class="alert alert-success display-hide">
						<button class="close" data-close="alert"></button>
						<strong>Success!</strong> 绑定成功！重新登陆后即可查看新设备。
					</div>
					<div id="msgFAIL" class="alert alert-danger display-hide">
					</div>
					<form class="form-horizontal" name="regform" id="regform">
						<div class="form-body">
							<div class="form-group">
								<label class="control-label col-md-3">设备序列号</label>
								<div class="col-md-4">
									<input type="text" name="serialnum" id="serialnum" class="form-control">
								</div>
							</div>
						</div>
						<script type="text/javascript">
							document.getElementById("serialnum").focus();
						</script>
						<div id="regcommit" class="form-actions fluid">
							<div class="col-md-offset-3 col-md-9">
								<button type="button" class="btn red" onclick="regsensor()">
									<i class="fa fa-check"></i> 绑定
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