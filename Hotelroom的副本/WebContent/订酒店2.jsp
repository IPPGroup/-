<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.ArrayList,hotel.Dao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<meta charset="UTF-8">
	<title>酒店</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/酒店主页样式.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/link.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/order1.js"></script>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<%
	ArrayList userlist=(ArrayList)session.getAttribute("userlist");
%>
 <div class="headline2">
	<h1 class="headline" align="center">全域旅游服务平台酒店信息</h1>

<div class="top">
<hr>
		<div class="top_block" id="fanhui"><a class="title" href="helper.jsp">返回</a></div>
		<div class="top_block" id="tuijain"><a class="title" href="酒店.jsp?id=1">推荐</a></div>
		<div class="top_block" id="zhoubian"><a class="title" href="searchsurrounding.jsp">搜索</a></div>
		<div class="top_block" id="qinzi"><a class="title" href="酒店.jsp?id=2">亲子</a></div>
	<hr>
</div >
<div class="select" >
<form action="订酒店2" method="post">
	<input id="button" type="button" name="button" value="价格/星级⬆️️" style="font-size:40px;text-align:center;" onclick="show()">
	<input id="button1" type="button" name="button1" value="筛选⬆️️" style="font-size:40px;text-align:center;" onclick="show1()">
	<table id="myTable"   style="display:none;border-bottom:1px solid black;">
	
		<tr>
			<td colspan="2" style="font-size:40px;color:grey;text-align:center">价格(每晚均价)</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
			¥<input type="text" name="value1" placeholder="最低价格:0" style="font-size:40px;border:1px solid grey;border-radius:10px">
			——
			¥<input type="text" name="value2" placeholder="最高价格:2000" style="font-size:40px;border:1px solid grey;border-radius:10px">
			</td>
		</tr>
		<tr>
			<td  style="font-size:40px;color:grey;text-align:center">星级</td>
		</tr>
		<tr>
			<td style="text-align:center"><lable><input type="radio" name="test" value="不限" checked="checked" /><span>不限</span></label></td>
    		<td style="text-align:center"><label><input type="radio" name="test" value="经济"/><span>二星/经济</span></label></td>
    		<td style="text-align:center"><label><input type="radio" name="test" value="舒适"/><span>三星/舒适</span></label></td>
    		<td style="text-align:center"><label><input type="radio" name="test" value="高档"/><span>四星/高档</span></label></td>
		</tr>
		<tr>
			<td style="text-align:center"><label><input type="radio" name="test" value="豪华"/><span>五星/豪华</span></label></td>
		<tr>
			<td colspan="2" style="text-align:center"><input class="button2" type="reset" id="reset" value="重置" style="font-size:40px"></td>
			<td colspan="2" style="text-align:center"><input class="button2" type="submit" name="7" value="查看" style="font-size:40px"></td>
		</tr>
	</table>
	</form>
	<form action="订酒店2" method="post">
	<table id="chongzhichakan" style="display:none;border-bottom:1px solid black;">
		<tr>
		<td colspan="4">
		<table id="shaixuan" style="display:none;">
	
		<tr>
			<td><input id="button3" type="button" name="pingpai" value="酒店品牌" style="font-size:40px;color:#ffe29c"onclick="show2()"></td>
		</tr>
		<tr>
			<td><input id="button8" type="button" name="fangzao" value="房型/早餐" style="font-size:40px;"onclick="show7()"></td>
		</tr>
		<tr>
			<td><input id="button9" type="button" name="zhuti" value="特色主题" style="font-size:40px;"onclick="show8()"></td>
		</tr>
		<tr>
			<td><input id="button10" type="button" name="yaoqiu" value="特殊要求" style="font-size:40px;"onclick="show9()"></td>
		</tr>
	</table>
	<table id="pingpai" style="display:none;">
		<tr>
			<td><input id="button4" type="button" name="jingji" value="经济型" style="font-size:40px;color:#ffe29c;" onclick="show3()"></td>
		</tr>
		<tr>
			<td><input id="button5" type="button" name="shushi" value="舒适型" style="font-size:40px;" onclick="show4()"></td>
		</tr>
		<tr>
			<td><input id="button6" type="button" name="gaodang" value="高档型" style="font-size:40px;" onclick="show5()"></td>
		</tr>
		<tr>
			<td><input id="button7" type="button" name="haohua" value="豪华型" style="font-size:40px;" onclick="show6()"></td>
		</tr>
	</table>
	<table id="jingji" style="display:none;">
		<%for(int i=0;i<userlist.size();i++){
			Dao user=(Dao)userlist.get(i);
			if(user.getSimpleinfo().equals("经济型")){
			%>
			<tr>
				<td><input type="checkbox" name="hotel" value=<%=user.getName() %> style="font-size:40px"><span><%=user.getName() %></span></td>
			</tr>
	<% }	}%>
	</table>
	<table id="shushi" style="display:none;">
		<%for(int i=0;i<userlist.size();i++){
			Dao user=(Dao)userlist.get(i);
			if(user.getSimpleinfo().equals("舒适型")){
			%>
			<tr>
				<td><input type="checkbox" name="hotel" value=<%=user.getName()%> style="font-size:40px"><span><%=user.getName()%></span></td>
			</tr>
	<% }	}%>
	</table>
	<table id="gaodang" style="display:none;">
		<%for(int i=0;i<userlist.size();i++){
			Dao user=(Dao)userlist.get(i);
			if(user.getSimpleinfo().equals("高档型")){
			%>
			<tr>
				<td><input type="checkbox" name="hotel" value=<%=user.getName()%> style="font-size:40px"><span><%=user.getName() %></span></td>
			</tr>
	<% }	}%>
	</table>
	<table id="haohua" style="display:none;">
		<%for(int i=0;i<userlist.size();i++){
			Dao user=(Dao)userlist.get(i);
			if(user.getSimpleinfo().equals("高端豪华型")){
			%>
			<tr>
				<td><input type="checkbox" name="hotel" value=<%=user.getName()%> style="font-size:40px"><span><%=user.getName()%></span></td>
			</tr>
	<% }	}%>
	</table>
	<table id="fangxingzaocan" style="display:none;">
		<tr>
			<td><input id="button11" type="button" name="fangxing" value="房型" style="font-size:40px;color:#ffe29c;" onclick="show10()"></td>
		</tr>
		<tr>
			<td><input id="button12" type="button" name="zaocan" value="早餐" style="font-size:40px;" onclick="show11()"></td>
		</tr>
	</table>
	<table id="fangxing" style="display:none;">
		<tr>
			<td><input type="checkbox" name="hotel" value="大床房" style="font-size:40px"><span>大床房</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="双人床" style="font-size:40px"><span>双人床</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="单人床" style="font-size:40px"><span>单人床</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="多张床" style="font-size:40px"><span>多张床</span></td>
		</tr>
	</table>
	<table id="zaocan" style="display:none;">
		<tr>
			<td><input type="checkbox" name="hotel" value="含早餐" style="font-size:40px"><span>含早餐</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="不含早餐" style="font-size:40px"><span>不含早餐</span></td>
		</tr>
	</table>
	<table id="zhuti" style="display:none;">
		<tr>
			<td><input type="checkbox" name="hotel" value="休闲度假" style="font-size:40px"><span>休闲度假</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="亲子酒店" style="font-size:40px"><span>亲子酒店</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="浪漫情侣" style="font-size:40px"><span>浪漫情侣</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="商务周边" style="font-size:40px"><span>商务周边</span></td>
		</tr>
		<tr>
		 	<td><input type="checkbox" name="hotel" value="火车站周边" style="font-size:40px"><span>火车站周边</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="地铁周边" style="font-size:40px"><span>地铁周边</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="大学周边" style="font-size:40px"><span>大学周边</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="精品酒店" style="font-size:40px"><span>精品酒店</span></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hotel" value="设计师酒店" style="font-size:40px"><span>设计师酒店</span></td>
		</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align:center;"><input class="button3" type="reset" id="reset" value="重置" style="font-size:40px" onclick="show12()"></td>
	<td colspan="2" style="text-aling:center;"><input class="button3" type="submit" name="7" value="查看" style="font-size:40px"></td>
	</tr>
	</table>
</form>
</div>
<div class="thr_top" id="thr_top">
	<%
	ArrayList userlist2=(ArrayList)request.getAttribute("userlist2");
	%>
   <%
   for(int i=0;i<userlist2.size();i++){
        Dao user=(Dao)userlist2.get(i);
        for (int j=0;j<userlist.size();j++){
        	Dao user1=(Dao)userlist.get(j);
			if(user.getName().equals(user1.getName())){%>
		<div class="thr_top1" thr_block>
		<a href="酒店.jsp?id=<%=j+1%>">
				<img class="img1" src=<%=user.getSrc() %>>
				<p class="name"><%=user.getName() %><span class="info"><%=user.getSimpleinfo()%></span></p>
				<p class="point"><span class="value"><%=user.getPoint()%></span>分以上|<%=user.getTheme()%></p>
				<p class="value"><span>¥</span><%=user.getValue()%><span>起</span></p>
			</a>
		</div>	
	<% }}
	}%>
	
</div>
	<div class="second">
	<ul>
		<div class="sec_block"><a class="sec_title" href="myOrder.jsp">我的订单</a></div>
		<div class="sec_block"><a class="sec_title" href="#">我的收藏</a></div>	
	</ul>			
	</div>

</body>
</html>
