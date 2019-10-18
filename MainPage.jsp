<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>MainPage</title>	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/OrderTicket.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript"><!--滚动播放-->
 
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
<body style="background-color:#e2e2e2;">

		<div>
			<div class="banner" style="position:relative;"><!-- 滚动图 -->	
				 <form class="bs-example bs-example-form" role="form"><!-- 搜索框 -->
			        <div  class="row" style="padding:30px 100px ;position:fixed;z-index:100;">
			            <div class="col-lg-6">
			                <div class="input-group input-group-lg" >
			                    <div class="input-group-btn" >
			                       <button type="button" class="btn btn-default 
			                        dropdown-toggle" data-toggle="dropdown" style="z-index:999;background-color:white;height:60px;font-size:35px;">杭州
			                            <span class="caret"></span>
			                            <span class="sr-only">切换下拉菜单</span>
			                        </button>
			                        <ul class="dropdown-menu">
			                            <li>
			                                <a href="#" style="font-size:40px;">重庆</a>
			                            </li>
			                            <li>
			                                <a href="#" style="font-size:40px;">武汉</a>
			                            </li>
			                            <li>
			                                <a href="#" style="font-size:40px;">其他</a>
			                            </li>
			                            <li class="divider"></li>
			                            <li>
			                                <a href="#" style="font-size:40px;">分离的链接</a>
			                            </li>
			                        </ul>
			                    </div><!-- /btn-group -->
			                    <input type="text" class="form-control" style="border:3px solid grey;height:60px;">
			                </div><!-- /input-group -->
			            </div><!-- /.col-lg-6 -->
			        </div><!-- /.row -->
			    </form>
			    
			    <ul class="img">
			        <li><img src="<%=request.getContextPath()%>/img/Hot.jpg" /></li>
			        <li><img src="<%=request.getContextPath()%>/img/westlake.jpg"  /></li>
			        <li><img src="<%=request.getContextPath()%>/img/naturalspot.jpg" /></li>
			        <li><img src="<%=request.getContextPath()%>/img/phtography.jpg"/></li>
			    </ul>
			    
			    <ul class="nav nav-pills nav-justified col-lg-6" style="font-size:40px;margin:400px 10px;width:100%;padding:0;">
				  <li class="active" style="width:0%;background-color:white;padding:15px 0px 15px 20px;"><a href="#">名胜古迹</a></li>
				  <li style="width:0%;background-color:white;padding:15px 0px;"><a href="#">主题乐园</a></li>
				  <li style="width:0%;background-color:white;padding:15px 0px;"><a href="#">游山玩水</a></li>
				  <li style="width:0%;background-color:white;padding:15px 0px;"><a href="#">展览馆</a></li>
				  <li style="width:0%;background-color:white;padding:15px 0px;"><a href="#">搜索</a></li>
				  <li style="width:0%;background-color:white;padding:15px 0px 15px 0px;"><a href="#">返回</a></li>
				</ul>		
			
				</div>

<br>

		<div style="background-color:white;border-top-left-radius:20px;border-top-right-radius:20px;"><!-- 次导航栏 -->
			<p style="font-size:40px;bold:bold;font-weight:900;padding:0px 0px 0px 20px;">人气景点</p>			
				<ul id="mytab" class="nav nav-pills " style="font-size:40px;padding:20px 20px;">
				  <li class="active" ><a href="#hot" data-toggle="tab">热门</a></li>
				  <li><a href="#westlake" data-toggle="tab">西湖美景</a></li>
				  <li><a href="#naturalEnvironment" data-toggle="tab">青山绿水</a></li>
				  <li><a href="#museum" data-toggle="tab">博物馆</a></li>
				  <li><a href="#photo" data-toggle="tab">摄影拍照</a></li>			  
				</ul>
		</div>
			<div id="myTabContent" class="tab-content" style="font-size:40px;bold:bold;font-weight:900;background-color:white;">
					<div class="tab-pane fade in active" id="hot"><p>Hot trip spots in autumn HangZhou.</p><img src="<%=request.getContextPath()%>/img/Hot.jpg" style="width:100%;height:400px;position:absolute;"></div>
					<div class="tab-pane fade" id="westlake"><p>WestLake is a famous tourist place.</p><img src="<%=request.getContextPath()%>/img/westlake.jpg" style="width:100%;height:400px;position:absolute;"></div>
					<div class="tab-pane fade" id="naturalEnvironment"><p>Lovely natural spots that have most likes.</p><img src="<%=request.getContextPath()%>/img/naturalspot.jpg" style="width:100%;height:400px;position:absolute;"></div>
					<div class="tab-pane fade" id="museum"><p>Local tradition museum and technology museum.</p><img src="<%=request.getContextPath()%>/img/museum.jpg" style="width:100%;height:400px;position:absolute;"></div>
					<div  class="tab-pane fade" id="photo"><p>Amazing spots to take photo.</p><img src="<%=request.getContextPath()%>/img/phtography.jpg" style="width:100%;height:400px;position:absolute;"></div>
			</div>
		<script>
		    $(function () {
		        $('#myTab li:eq(1) a').tab('show');
		    });
		</script>
		
		<div>
			
		
		</div>

</body>
</html>