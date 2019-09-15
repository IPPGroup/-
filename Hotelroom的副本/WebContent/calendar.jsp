<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选择日期</title>
<link rel="stylesheet" type="text/css" href="./css/style_for_calendar.css">
</head>
<body>
	<div id="header">
		<div id="title">
			<div id="back" class="title"><p class="title"><</p></div>
			<div class="title"><p class="title">选择日期</p></div>
		</div>
		<div id="week_line">
			<div class="week"><p class="week special">日</p></div>
			<div class="week"><p class="week">一</p></div>
			<div class="week"><p class="week">二</p></div>
			<div class="week"><p class="week">三</p></div>
			<div class="week"><p class="week">四</p></div>
			<div class="week"><p class="week">五</p></div>
			<div class="week"><p class="week special">六</p></div>
		</div>
	</div>
	<div id="none"></div>
	<% 
		String get_s_day=null;
		String get_e_day=null;
		Cookie[] s=request.getCookies();
		Cookie[] e=request.getCookies();	
		for(Cookie cookie : s){
		    if(cookie.getName().equals("s_day")){
		        get_s_day = cookie.getValue();
		    }
	 	}
		for(Cookie cookie : e){
		    if(cookie.getName().equals("e_day")){
		        get_e_day = cookie.getValue();
		    }
	 	}
		DateTimeFormatter df=DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate today=LocalDate.now();
		LocalDate s_day=LocalDate.parse(get_s_day,df);
		LocalDate e_day=LocalDate.parse(get_e_day,df);
		session.setAttribute("s_day", s_day.getYear()+"-"+s_day.getMonthValue()+"-"+s_day.getDayOfMonth());
		session.setAttribute("e_day", e_day.getYear()+"-"+e_day.getMonthValue()+"-"+e_day.getDayOfMonth());
		int currentYear=today.getYear();
		int currentMonth=today.getMonthValue();
		int dateOfMonth=today.getDayOfMonth();
		DayOfWeek dateOfWeek=s_day.getDayOfWeek();
		DayOfWeek[] weeks={DayOfWeek.SUNDAY,DayOfWeek.MONDAY,DayOfWeek.TUESDAY,DayOfWeek.WEDNESDAY,DayOfWeek.THURSDAY,DayOfWeek.FRIDAY,DayOfWeek.SATURDAY};
		for(int i=0;i<7;i++){	//之后7个月
			LocalDate firstDay=LocalDate.of(currentYear, currentMonth, 1);
			boolean flag=false;	//判断是否生成1号
			int buildDay=1;
	%>
			<div class="month"><% out.print(currentYear+"年"+currentMonth+"月");%></div>
	<%
			for(int j=0;j<5;j++){	//5排日期
				for(int k=0;k<7;k++){
					if(flag==false&&!firstDay.getDayOfWeek().equals(weeks[k])){
						//空白格
	%>
						<div class="dayblock" id="2000-1-1"></div>
	<%		
					}else{
	%>
						
						<div class="<%=weeks[k]%> dayblock" id="<%=(currentYear+"-"+currentMonth+"-"+buildDay)%>">
						<% 
						if(LocalDate.of(currentYear, currentMonth, buildDay).isBefore(today)){
							//今天之前的日期
						%>
							<p class="pass date">
						<% 
						}else{ 
						%>
							<p class="date">
						<%
						}
						if(flag&&buildDay<firstDay.lengthOfMonth()){
							//已经生成1号并且日期小于当月天数
							out.print(buildDay);
							buildDay++;
						}else if(flag&&buildDay==firstDay.lengthOfMonth()){
							out.print(buildDay);
							flag=false;
						}
						if(firstDay.getDayOfWeek().equals(weeks[k])&&!flag&&buildDay==1){
							//生成1号
							flag=true;
							out.print(buildDay);
							buildDay++;
						}
						%>
						</p>
						</div>
	<% 
					}
				}
			}
			currentMonth++;
			if(currentMonth>12){
				currentYear++;
				currentMonth=1;
			}
		}
	%>
<%@ include file="select.jsp" %>
<script type="text/javascript" src="./js/calendar_link2.js"></script>
</body>
</html>