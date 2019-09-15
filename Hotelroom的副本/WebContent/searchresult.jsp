<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.HashSet,java.util.Set,java.util.ArrayList,hotel.Room,hotel.Dao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索酒店</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/search.css">
</head>
<body>

<div align="center" class="search">
  <form action="searchresult" method="post">
  <a href="searchsurrounding.jsp" class="back"><</a><input type="text" name="search" placeholder=<%=request.getParameter("search") %>>
  <input type="submit" value="搜索">
  </form>
</div>
<hr>
<div class="result" >
	<h3 align="center">全域旅游为您搜索的结果</h3>

  <%
  ArrayList userlist=(ArrayList)session.getAttribute("userlist");
  for(int j=0;j<userlist.size();j++){
	  Dao user=(Dao) userlist.get(j);
 	  if(request.getAttribute("roomlist")!=null){
 		ArrayList roomlist = (ArrayList) request.getAttribute("roomlist");
 		Set<String> s = new HashSet<String>();
  		for(int i=0;i<roomlist.size();i++){
  			Room room=(Room)roomlist.get(i);
  			boolean b= s.add(room.getHotelname());
	  			if(b && room.getHotelname().equals(user.getName())){%>
	 				<div class="display">
	   					<div class="thr_top1" thr_block>
							<a href="酒店.jsp?id=<%=i+1%>">
							<img class="img1" src=<%=user.getSrc() %>>
							<p class="name"><%=user.getName() %><span class="info"><%=user.getSimpleinfo()%></span></p>
							<p class="point"><span class="value"><%=user.getPoint()%></span>分以上|<%=user.getTheme()%></p>
							<p class="value"><span>¥</span><%=user.getValue()%><span>起</span></p>
			</a>
						</div>	
					</div> 
<% }}}
 }%>
</div>
</body>
</html>