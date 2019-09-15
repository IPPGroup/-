<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";font-size:12px;}
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=rnGqVhxOr6hD8F5IE1pvFCZ7wpBVigPE"></script>
    <title>精准定位</title>
</head>
<body>
	<button onclick="getLocation()">search</button>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
function getLocation(){ 
	if (navigator.geolocation){ 
	navigator.geolocation.getCurrentPosition(showPosition,showError); 
	}else{ 
	alert("浏览器不支持地理定位。"); 
	} 
	} 
function showError(error){ 
	switch(error.code) { 
	case error.PERMISSION_DENIED: 
	alert("定位失败,用户拒绝请求地理定位"); 
	break; 
	case error.POSITION_UNAVAILABLE: 
	alert("定位失败,位置信息是不可用"); 
	break; 
	case error.TIMEOUT: 
	alert("定位失败,请求获取用户位置超时"); 
	break; 
	case error.UNKNOWN_ERROR: 
	alert("定位失败,定位系统失效"); 
	break; 
	} 
	} 

function showPosition(position){ 
	var y = position.coords.latitude; //纬度 
	var x = position.coords.longitude; //经度 
	var ggPoint = new BMap.Point(x,y);
	//地图初始化
	var map = new BMap.Map("allmap");
	map.centerAndZoom(ggPoint, 15);
	map.addControl(new BMap.NavigationControl());
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	//坐标转换完之后的回调函数
	translateCallback = function (data){
	  if(data.status === 0) {
	    var marker = new BMap.Marker(data.points[0]);
	    map.addOverlay(marker);
	    var label = new BMap.Label("当前位置",{offset:new BMap.Size(20,-10)});
	    marker.setLabel(label); //添加百度label
	    map.setCenter(data.points[0]);
	  }
	}

	setTimeout(function(){
	    var convertor = new BMap.Convertor();
	    var pointArr = [];
	    pointArr.push(ggPoint);
	    convertor.translate(pointArr, 1, 5, translateCallback)
	}, 1000);
}
</script>