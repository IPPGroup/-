<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>旅游助手</title>
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sec_list.css">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/bottom.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/block.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/helper.css">
</head>
<body>
	<div>
		<h1 align="center" class="headline">全域旅游服务平台</h1>
	</div>
	<div id="main">
		<form action="订酒店" method="post">
		<div class="block_1"><p class="word_in_block">买门票</p></div><br>
		<div class="block_2"><p class="word_in_block"><input type="submit" value="订酒店" class="input"></p></div><br>
		<div class="block_3"><p class="word_in_block">农家乐</p></div><br>
		<div class="block_4"><p class="word_in_block">寻美食</p></div><br>
		<div class="block_5"><p class="word_in_block">特产购买</p></div><br>
		<div class="block_6"><p class="word_in_block">包租车</p></div><br>
		<div class="block_7"><p class="word_in_block">导游预约</p></div><br>
		<div class="block_8"><p class="word_in_block">在线客服</p></div><br>
		<div class="block_9"><p class="word_in_block">优惠活动</p></div><br>
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
</body>
</html>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/link.js"></script>
<script type="text/javascript" src="js/bottom.js"></script>