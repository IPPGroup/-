<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>旅游百宝箱</title>
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sec_list.css">
		<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/bottom.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/block.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/box.css">
</head>
<body>
<div>
		<h1 align="center" class="headline">全域旅游服务平台</h1>
	</div>
	<div id="main">
		<div class="block_1"><p class="word_in_block">热点景区介绍</p></div><br>
		<div class="block_2"><p class="word_in_block">旅游线路推荐</p></div><br>
		<div class="block_3"><p class="word_in_block">导游导览</p></div><br>
		<div class="block_4"><p class="word_in_block">景区直播</p></div><br>
		<div class="block_5"><p class="word_in_block">厕所信息</p></div><br>
		<div class="block_6"><p class="word_in_block">旅游攻略</p></div><br>
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
</body>
</html>
<script type="text/javascript" src="js/link.js"></script>
<script type="text/javascript" src="js/bottom.js"></script>