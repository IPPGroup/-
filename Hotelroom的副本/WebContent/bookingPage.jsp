<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.net.URLDecoder,java.util.ArrayList,hotel.Dao,java.util.*,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>预订</title>
	<link rel="stylesheet" type="text/css" href="css/bookingPage.css">
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
		if(!window.jQuery){
    		document.write('<script type="text/javascript" src="jquery-3.4.1.min.js"><'+'/script>');
    	}
	</script>
	
</head>
<body >
    <%
    request.setCharacterEncoding("UTF-8");
    ArrayList userlist=(ArrayList)session.getAttribute("userlist");
	String id=request.getParameter("id");
	String []f1= id.split(",");
	int num=Integer.valueOf(f1[1]);
	Dao userstyle=(Dao)userlist.get(Integer.valueOf(f1[0])-1);
	String Url="jdbc:mysql://127.0.0.1:3306/hotel";
	 String user="root";
	 String password="88939668";
	 int flag=0;
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection(Url, user, password);
	 request.setCharacterEncoding("UTF-8");
		String s1=userstyle.getName();
		String sql1="select * from hotelroom,roominfo where hotelroom.name='"+s1+"' and hotelroom.name=roominfo.hotelname;";
		PreparedStatement pstm1 = con.prepareStatement(sql1);
		ResultSet result1 = pstm1.executeQuery();
		List<Dao> userlist5=new ArrayList<Dao>();
		Dao userdao[]=new Dao[100];
		while(result1.next()) {
			userdao[flag]=new Dao(result1.getString("name"),result1.getString("simpleinfo"),result1.getString("detailedinfo"),
					result1.getString("src"),result1.getDouble("value"),result1.getString("roomstyle"),result1.getDouble("roomvalue"),
					result1.getInt("number"),result1.getString("roomsrc"),result1.getString("info"));
			userlist5.add(userdao[flag]);
			flag++;
		}
		request.setAttribute("userlist5", userlist5);
    %>
	<%@include file="data.jsp" %>
	<form action="myOrder" method="post">
	<div id="header">
		<div id="back">
		<a href="酒店.jsp?id=<%=Integer.valueOf(f1[0])%>">
		<p><</p>
		</a>
		</div>
		<div id="hotelName"><p><%=userdao[num-1].getName()%></p></div>
		
	</div>
	<div id="none"></div>

	<div id="roomMess">
		<div id="roomType"><p><%=userdao[num-1].getRoomstyle() %></p></div>
		<%String date=(String)session.getAttribute("date");
		  String []esday=date.split(",");
		 %>
		<div id="time" class="subMess"><p>入住：<%=esday[0]%> 离店：<%=esday[1] %>
		<%! 
		int calDuration(String begin,String end){
			String[] s=begin.split("-");
			String[] e=end.split("-");
			int[] daysOfMonth={0,31,28,31,30,31,30,31,31,30,31,30,31};
			int days=0;
			int syy=Integer.valueOf(s[0]);
			int eyy=Integer.valueOf(e[0]);
			int smm=Integer.valueOf(s[1]);
			int emm=Integer.valueOf(e[1]);
			int sdd=Integer.valueOf(s[2]);
			int edd=Integer.valueOf(e[2]);
			if(isLeapYear(eyy)){
				daysOfMonth[2]=29;
			}
			for(int i=smm,y=syy;i<emm||y<eyy;i++){
				if(i>12){
					i=0;
					y++;
				}
				days+=daysOfMonth[i];
			}
			days=days-sdd+edd;
			return days;
		}
		boolean isLeapYear(int yy){	//判断是否闰年
			if((yy%4==0&&yy%100!=0)||yy%400==0){
				return true;
			}else{
				return false;
			}
		}
	%>
	 <%=calDuration(esday[0],esday[1])%>晚</p></div>
		<div id="bedMess" class="subMess"><p><%=userdao[num-1].getRoomstyle() %></p></div>
	</div>
	<div id="bookingMess">
		<div id="number" class="subMess">
			<div class="mess">
				<p>房间数</p>
			</div>
			<select id="roomNum" name="roomnumber">
			<%
			for(int i=1;i<=10;i++){%>
				<option value=<%=i %> class="room"><%=i %>间</option>
			<%} %>
			</select>
		</div>
		<div id="guestName" class="subMess guest">
			<div class="mess">
				<p>住客姓名</p>
			</div>
			<input type="text" name="name" placeholder="姓名，每间只需填写1人">
		</div>
		<div class="subMess guest">
			<div class="mess">
				<p>手机号码</p>
			</div>
			<input type="text" name="phoneNumber" placeholder="用于接收通知">
		</div>
	</div>
	<div id="bottom">
		<input type="submit" name="goPay" value="去支付">
		<div id="tipBox">
			<p id="tip1" class="tip">需支付</p>
			<p id="tip2" class="tip">￥</p>
			<%
			DecimalFormat moneyFormat1 = new DecimalFormat("0.0");	
			 String money1=moneyFormat1.format(userdao[num-1].getRoomvalue()*calDuration(esday[0],esday[1]));
			%>
			<input type="hidden" id="money2" value=<%=money1%>>
			<%String info=userdao[num-1].getName()+","+date+","+money1+","+id+","+userdao[num-1].getRoomstyle()+","+userdao[num-1].getNumber(); %>
			<input type="hidden" name="info" value=<%=info %>>
			<input type="text" id="money" class="tip" placeholder=<%=money1%> disabled="disabled" style="background-color:white;font-size:50px;border:none">
		</div>		
	</div>
	<div id="bottom_none"></div>
	</form>
<script type="text/javascript" src="js/roomNumber.js"></script>
</body>
</html>