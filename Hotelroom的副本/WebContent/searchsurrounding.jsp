<%@ page language="java" contentType="text/html; charset=UTF-8" import="hotel.Dao,hotel.Room,java.util.ArrayList,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索周边</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/search.css">
</head>
<body>
<div align="center" class="title">
  <h1>全域旅游服务平台</h1>
  <h2>搜索酒店</h2>
</div> 
<div align="center" class="search">
  <form action="searchresult" method="post">
  <a href="订酒店.jsp" class="back"><</a><input type="text" name="search" placeholder="搜索您所喜欢的酒店">
  <input type="submit" value="搜索">
  </form>
</div>
</body>
</html>