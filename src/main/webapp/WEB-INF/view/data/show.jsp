<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/divide/header.jsp"%>

<script type="text/javascript">
$(function () {
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
    
        var chart;
        $('#container').highcharts({
            chart: {
                type: 'spline',
                animation: Highcharts.svg,
                marginRight: 10,
                events: {
                    load: function() {
                        var series = this.series[0];
                        var series2 = this.series[1];
                        var series3 = this.series[2];
                        setInterval(function() {
                        	$.ajax({
                      	      type: "post",
                      	      url: "realtime",
                      	   	  data: { serialnum : "${serialnum}" },
                      	      dataType: "json",
                      	      success : function(data){
	                      	    	var x = (new Date()).getTime();
	              	    		  	var y = parseInt(data.temperature);
	              	    			var z = parseInt(data.co);
	              	    			var q = parseInt(data.smoke);
	                            	series.addPoint([x, y], false, true);
	                            	series2.addPoint([x, z], true, true);
	                            	series3.addPoint([x, q], true, true);
                      	      }
                      	    });
                        	
                        }, 7000);
                    }
                }
            },
            title: {
                text: '使用鼠标悬停查看详细信息'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Value'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: '温度',
                data: (function() {
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: 0
                        });
                    }
                    return data;
                })()
            },
            {
                name: '一氧化碳',
                data: (function() {
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: 0
                        });
                    }
                    return data;
                })()
            },
            {
                name: '光线强度',
                data: (function() {
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: 0
                        });
                    }
                    return data;
                })()
            }]
        });
    });
    
});
</script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>

<%@ include file="/WEB-INF/view/divide/left.jsp"%>

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<h3 class="page-title">欢迎登陆火灾数据监控平台</h3>
			<!-- END PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="fa fa-home"></i> <a href="#">首页</a> <i
					class="fa fa-angle-right"></i></li>
				<li><i class="fa fa-th"></i> <a href="#">实时数据</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="#">${serialnum}</a></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">实时数据展示</h3>
				</div>
				<div class="panel-body">
					<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
				</div>
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