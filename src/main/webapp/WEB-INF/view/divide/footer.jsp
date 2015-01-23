<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="footer-inner">2014 &copy; <a href="http://zhilong.me">zhilong.me</a></div>
	<div class="footer-tools">
		<span class="go-top"> <i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
<!-- END FOOTER -->
<!-- BEGIN CORE PLUGINS -->
<script src="plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
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