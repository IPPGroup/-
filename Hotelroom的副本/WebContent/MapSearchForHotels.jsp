<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:300px;width:100%;}
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rnGqVhxOr6hD8F5IE1pvFCZ7wpBVigPE"></script>
	<title>酒店位置</title>
</head>
<body>

	<div id="l-map"></div>
	<div><input type="text" id="search" value="雅津宾馆"></div>
	<h3 id="bar"></h3>
	<div id="r-result"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");   
	// 创建Map实例
	function myFun(result){
		var cityName = result.name;		
		document.getElementById('bar').value=cityName;
	map.centerAndZoom(document.getElementById('bar').value, 13);
	console.log(document.getElementById('bar').value);
	var myKeys = [document.getElementById('search').value];
	console.log(myKeys);
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map, panel:"r-result"},
		pageCapacity:5
	});
	local.searchInBounds(myKeys, map.getBounds());
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>