<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
 <html class="no-js"> 
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>用户注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="css/style.css" rel="stylesheet" type="text/css"/>
	<link href="css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="css/pages/login.css" rel="stylesheet" type="text/css"/>
	<!-- 自定义CSS样式，便于不破坏完整性。 -->
	<link href="css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
	
<script type="text/javascript">
	function checkusername() {
		$.ajax({
		      type: "post",
		      url: "checkusername",    
		      data: { username : regform.username.value },
		      dataType: "json",
		      success : function(data){
		    	  $.each(data,function(){
		    			if (data.msg == 1) {
		    				$("#checkFAIL").hide();
		    				$("#checkSUCC").show();
		    				$("#regcommit").show();
		    			}else {
		    				$("#checkFAIL").show();
		    				$("#checkSUCC").hide();
		    				$("#regcommit").hide();
		    			}
				  });
		      }
		});
	}
	
	function register() {
		$("#checkFAIL").hide();
		$("#checkSUCC").hide();
		$.ajax({
		      type: "post",
		      url: "register",    
		      data: { username : regform.username.value, password : regform.password.value, nickname : regform.nickname.value, phonenum : regform.phonenum.value },
		      dataType: "json",
		      success : function(data){
		    	  $.each(data,function(){
		    			if (data.msg == 1) {
		    				$("#regFAIL").hide();
		    				$("#regSUCC").show();
		    				$("#regcommit").show();
		    				setTimeout("window.location='index.bms'",1000);
		    			}else {
		    				$("#regFAIL").show();
		    				$("#regSUCC").hide();
		    			}
				  });
		      }
		});
	}
</script>
	
</head>
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" name="regform" method="POST">
			<h3 class="form-title">新用户注册</h3>
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>请输入用户名和密码！</span>
			</div>
			
			<div id="checkSUCC" class="alert alert-success display-hide">
				<button class="close" data-close="alert"></button>
				<span>该用户名可以使用</span>
			</div>
			
			<div id="checkFAIL" class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>该用户名已经被注册</span>
			</div>
			
			<div id="regSUCC" class="alert alert-success display-hide">
				<button class="close" data-close="alert"></button>
				<span>注册成功！</span>
			</div>
			
			<div id="regFAIL" class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>注册失败！</span>
			</div>
			
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" onblur="checkusername()"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="昵称" name="nickname"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="手机号" name="phonenum"/>
				</div>
			</div>
			<div id="regcommit" class="form-actions display-hide">
				<button type="button" class="btn green pull-right" onclick="register()">
				注册 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END LOGIN FORM -->        
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div id="copyright">
		2014 &copy; Alex
	</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
	<script src="plugins/respond.min.js"></script>
	<script src="plugins/excanvas.min.js"></script>
	<![endif]-->
	<script src="plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="plugins/jquery.cookie.min.js" type="text/javascript"></script>
 	<script src="plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="scripts/app.js" type="text/javascript"></script>
	<script src="scripts/login.js" type="text/javascript"></script>
	<!--IE Fixed placeholder, need extra style define-->
	<script src="scripts/placeholder.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>