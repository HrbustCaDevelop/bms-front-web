<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>平台登陆</title>
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
	function login() {
		$("#logincommit").hide();
		$.ajax({
		      type: "post",
		      url: "login",    
		      data: { username : loginform.username.value, password : loginform.password.value },
		      dataType: "json",
		      success : function(data){
		    	  $.each(data,function(){
		    			if (data.msg == 1) {
		    				$("#msgSUCC").show();
		    				$("#msgFAIL").hide();
		    				setTimeout("window.location='main.bms'",2000);
		    			}else {
		    				$("#logincommit").show();
		    				$("#msgSUCC").hide();
		    				$("#msgFAIL").show();
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
		<form class="login-form" name="loginform" id="loginform" method="POST">
			<h3 class="form-title">楼宇防火监测平台登陆</h3>
			
			<div id="msgSUCC" class="alert alert-success display-hide">
				<button class="close" data-close="alert"></button>
				<strong>Success!</strong> 登陆成功!跳转中
			</div>
			<div id="msgFAIL" class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<strong>Error!</strong> 用户名或密码错误!
			</div>

			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
				</div>
			</div>
			<div id="logincommit" class="form-actions">
				<label class="checkbox">
					<input type="checkbox" name="remember" value="1"/> 记住密码
				</label>
				<label class="checkbox">
					<a href="register.bms">点我注册</a>
				</label>
				<button type="button" class="btn green pull-right" onclick="login()">
				登陆 <i class="m-icon-swapright m-icon-white"></i>
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