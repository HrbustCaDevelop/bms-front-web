<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据展示页</title>

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</style>
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
                        var series1 = this.series[0];
                        var series2 = this.series[1];
                        var series3 = this.series[2];
                        setInterval(function() {
                        	var senid = ${serialnum};
                        	$.ajax({
	                       	      type: "post",
	                       	      url: "realtime?serialnum=" + senid,    
	                       	      dataType: "json",
	                       	      success : function(data){
	                       	    	  $.each(data,function(){
	                       	    		  	var x = (new Date(data.point.nowtime)).getTime(); //得到毫秒数	
	                       	    		  	var a = parseInt(data.point.temperature);
	                       	    		 	var b = parseInt(data.point.co);
	                       	    		 	var c = parseInt(data.point.flash);
	 		                            	series1.addPoint([x, a], false, true);
	 		                            	series2.addPoint([x, b], false, true);
	 		                            	series3.addPoint([x, c], true, true);
	                     				});
	                       	      }
	                       	    });
                        }, 1000);
                    }
                }
            },
            title: {
                text: '当前设备数据，使用鼠标悬停显示详细信息！'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
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
                            x: time + i * 10000,  
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
	<script src="js/highcharts.js"></script>
	<script src="js/modules/exporting.js"></script>

	<div id="container"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>
