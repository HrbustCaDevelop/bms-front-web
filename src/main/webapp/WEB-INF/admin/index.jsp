<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>楼宇防火监测系统</title>
	
<script type="text/javascript">
	$(document).ready(function() 
    	{ 
      	  $(".tablesorter").tablesorter(); 
   	 } 
	);
	$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
    </script>
    <script type="text/javascript">
    $(function(){
        $('.column').equalHeight();
    });
</script>
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
		                animation: Highcharts.svg, // don't animate in old IE
		                marginRight: 10,
		                events: {
		                    load: function() {
		                        var series = this.series[0]; 
		                        var series2 = this.series[1];
		                        setInterval(function() {
		                        	var senid = window.document.getElementById("senid").value;
		                        	 $.ajax({
		                        	      type: "post",
		                        	      url: "GetData?senid=" + senid,    
		                        	      dataType: "json",
		                        	      success : function(data){
		                        	    	  $.each(data,function(){
		                        	    		  	var x = (new Date(data.point.nowtime)).getTime(); //得到毫秒数	
		                        	    		  	var y = parseInt(data.point.temperature);
		                        	    		 	var z = parseInt(data.point.humidity);
		  		                            	series.addPoint([x, y], false, true);
		  		                            	series2.addPoint([x, z], true, true);
		                      				});
		                        	      }
		                        	    });
		                        }, 10000);
		                    }
		                }
		            },
		            title: {
		                text: '当前显示 节点${lastid} 的实时数据'
		            },
		            xAxis: {
		            	type: 'datetime',
	                	tickPixelInterval: 180
		            },
		            yAxis: {
		                title: {
		                    text: '数值'
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
		            credits: {  
		                enabled: false     //去掉highcharts网站url  
		            },
		            series: [{
		                name: '温度',
		                data: (function() {  
		                    // generate an array of random data  
		                    var data = [],  
		                        time = (new Date()).getTime(),  
		                        i;  
		      
		                    for (i = -19; i <= 0; i++) {  
		                        data.push({  
		                            x: time + i * 10000,  
		                            y: 0
		                        });  
		                    }  
		                    return data;
		                })()
		            },
		            {
		                name: '湿度',
		                data: (function() {  
		                    // generate an array of random data  
		                    var data = [],  
		                        time = (new Date()).getTime(),  
		                        i;  
		      
		                    for (i = -19; i <= 0; i++) {  
		                        data.push({  
		                            x: time + i * 10000,  
		                            y: 0
		                        });  
		                    }  
		                    return data;
		                })()
		            }
		            ]
		        });
		    });
		    
		});
	</script>

</head>
<body>
	<%@ include file="/divide/header.jsp"%>
	<%@ include file="/divide/lefter.jsp"%>
	<%@ include file="/divide/footer.jsp"%>
	
	<section id="main" class="column">
		<h4 class="alert_info">欢迎使用楼宇防火监测系统，鼠标悬停于曲线可以实时查看数据。</h4>
		<article class="module width_full">
			<header><h3>数据动态</h3></header>	
			<input type="hidden" name="senid" id="senid" value="${lastid}">
			<div id="container" style="min-width: 310px; height: 480px; margin: 0 auto"></div>
		</article>
		<div class="clear"></div>
		<div class="spacer"></div>
	</section>
</body>
</html>