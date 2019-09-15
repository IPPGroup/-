<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.format.DateTimeFormatter,java.time.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>旅游小程序</title>
	 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	  <script type="text/javascript" src="https://3gimg.qq.com/lightmap/components/geolocation/geolocation.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/MainList.css">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/样式.css">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/bottom.css">
	<style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";font-size:12px;}
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=rnGqVhxOr6hD8F5IE1pvFCZ7wpBVigPE"></script>
	 <script type="text/javascript">
 
        $(document).ready(function () {
 
            var i = 0;
 
            var clone = $(".banner .img li").first().clone();
            $(".banner .img").append(clone);
            var size = $(".banner .img li").size();
            console.log(size);
 
 
            for (var j = 0; j < size-1; j++) {
                $(".banner .num").append("<li></li>");
            }
 
            $(".banner .num li").first().addClass("on");
 
           
 
            var t = setInterval(function () { i++; move();},2000);
 
           
 
            $(".banner").hover(function () {
                clearInterval(t);
            }, function () {
                t = setInterval(function () { i++; move(); }, 2000); 
            });
 
            
 
            $(".banner .num li").hover(function () {
 
                var index = $(this).index();
                i = index;
                $(".banner .img").stop().animate({ left: -index * 1422 }, 500);
                $(this).addClass("on").siblings().removeClass("on");
            });
 
                        $(".banner .btn_r").click(function () {
                i++;
                move();
            })
 
            
            $(".banner .btn_l").click(function () {
                i--;
                move();
            })
 
            
            function move() {
                if (i == size) {
                    $(".banner .img").css({ left: 0 });
                    i = 1;
                }
                if (i == -1) {
                    $(".banner .img").css({ left: -(size - 1) * 1422 });
                    i = size - 2;
                }
                $(".banner .img").stop().animate({ left: -i * 1422 }, 500);
 
                if (i == size - 1) {
                    $(".banner .num li").eq(0).addClass("on").siblings().removeClass("on");
                } else {
                    $(".banner .num li").eq(i).addClass("on").siblings().removeClass("on");
                }
            }
        });
 
 
    </script>
</head>
<body >
	<form>
		<div class="box">
			<h1>欢迎您使用</h1>
			<br>
			<h2>全域旅游服务平台</h2>
			</div>
			<a href="destination.jsp"><h3>目的地：杭州</h3></a>
<script type="text/javascript">
var geolocation = new qq.maps.Geolocation("OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77", "myapp");
function showPosition(position)
{var str;
str=JSON.stringify(position, null, 4)
document.write("<pre>" + str + "</pre>" );
}
</script>
		<button onclick="showPostion">search</button>	
	<button onclick="getLocation()">search</button>
	<div id="allmap"></div>

			<div class="banner">
    <ul class="img">
        <li><img src="<%=request.getContextPath()%>/img/background.jpg" /></li>
        <li><img src="<%=request.getContextPath()%>/img/river.jpg"  /></li>
        <li><img src="<%=request.getContextPath()%>/img/西湖.jpg" /></li>
        <li><img src="<%=request.getContextPath()%>/img/night.jpg"/></li>
    </ul>
    <ul class="num">
 
    </ul>
    <div class="btn btn_l">&lt;</div>
    <div class="btn btn_r">&gt;</div>
    </div>
<div class="mainlist">
<form acion="订酒店" method="post">
		<table class="maintable">
 			<tr class="accomodation">
 			<th class="top-left" id="jiudian" onclick="open_jiudian()">酒店</th>
 			<th style="background-color:#e97c5c" id="minsu" onclick="open_minsu()">名宿·客栈</th>
 			<th style="background-color:#f5c260" id="bieshu" onclick="open_bieshu()">别墅</th>
 			<th class="top-right" id="qinnianlvshe" onclick="open_qinnianlvshe()">青年旅舍</th>
 			</tr>
 			<tr class="ticket">
 			<th style="background-color:#5d90e5" id="feiji" onclick="open_feiji()">飞机票</th>
 			<th style="background-color:#64a1e7" id="huoche" onclick="open_huoche">火车票</th>
 			<th style="background-color:#68a9e6" id="jindianmengpiao" onclick="open_jindianmengpiao()">景点门票</th>
 			<th style="background-color:#6db5e7" id="gaotie" onclick="open_gaotie()">高铁票</th>
 			</tr>
 			<tr class="food">
 			<th class="bottom-left" id="nongjiale" onclick="open_nongjiale">农家乐</th>
 			<th style="background-color:#70c78d" id="meishijie" onclick="open_meishijie()">美食街</th>
 			<th style="background-color:#7acc7b" id="canguan" onclick="open_canguan()">餐馆</th>
 			<th class="bottom-right" id="xiaochi" onclick="open_xiaochi()">小吃</th>
 			</tr>		
 					
 					
 		</table>
 		</form>
	</div>
    
		<div class="bottom_mainlist">
		<table class="bottom_maintable">
 			<tr>
 			<th class="bottom_th1" id="MainPage" onclick="open_MainPage()">首页</th>
 			<th  class="bottom_th2" id="destination" onclick="open_destination()" >目的地</th>
 			<th  class="bottom_th3" id="helper" onclick="open_helper()" >助手</th>
 			<th   class="bottom_th4" id="box" onclick="open_box()" >百宝箱</th>
 			<th   class="bottom_th5" id="ClientPage" onclick="open_Client()" >我的主页</th>
 			</tr>
 			
 		</table>
	</div>
		
	</form>
	
</body>
</html>
<script type="text/javascript" src="js/MainList.js"></script>
<script type="text/javascript" src="js/bottom.js"></script>
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