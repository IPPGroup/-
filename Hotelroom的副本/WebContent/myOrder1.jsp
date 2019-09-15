
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.text.*,java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的订单</title>
	<link rel="stylesheet" type="text/css" href="css/myOrder.css">
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
		if(!window.jQuery){
    		document.write('<script type="text/javascript" src="jquery-3.4.1.min.js"><'+'/script>');
    	}
	 	
	</script>
</head>
<body>

<%  
    Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
    String url = "jdbc:mysql://127.0.0.1:3306/hotel"; //数据库名
    String username = "root";  //数据库用户名
    String password = "88939668";  //数据库用户密码
    Connection conn = DriverManager.getConnection(url, username, password);  //连接状态        
    Statement stmt = null;  
    ResultSet rs = null;
    int rs2=0;
	String sql = "SELECT * FROM myorder where status != '已删除';";  //查询语句
    stmt = conn.createStatement();
   
   	
	rs = stmt.executeQuery(sql); 
    
    ArrayList<Integer> orderNum=new ArrayList<Integer>();
    ArrayList<String> hotelName=new ArrayList<String>();
    ArrayList<String> s_day=new ArrayList<String>();
    ArrayList<String> e_day=new ArrayList<String>();
    ArrayList<Integer> roomNum=new ArrayList<Integer>();
    ArrayList<String> price=new ArrayList<String>();
    ArrayList<String> status=new ArrayList<String>();
	int sumOrder=0;	//总订单数
	DecimalFormat moneyFormat = new DecimalFormat("0.00");	//价格格式
    while (rs.next()) {  
    	orderNum.add(rs.getInt("pnumber"));
    	hotelName.add(rs.getString("hotelname"));
    	s_day.add(rs.getString("s_day"));
    	e_day.add(rs.getString("e_day"));
    	roomNum.add(rs.getInt("roomNum"));
    	price.add(moneyFormat.format(rs.getDouble("price")));
    	status.add(rs.getString("status"));
    	sumOrder++;
    }
	if(request.getParameter("cancel")!=null){
    String cancel=request.getParameter("cancel");
    rs2=stmt.executeUpdate("UPDATE hotel.myorder SET status='已取消' WHERE (pnumber='"+cancel+"')");
	}
	else if(request.getParameter("delete")!=null){
    String delete=request.getParameter("delete");
    rs2=stmt.executeUpdate("update hotel.myorder set status='已删除' where pnumber='"+delete+"'");
	}
%>

<%! 
	String plusZero(String str){	//添加0
		if(str.length()==1){
			str="0"+str;
		}
		return str;
	}
	String dateType(String str) {	//转为日期
		String[] arr=str.split("-");
		return plusZero(arr[1])+"-"+plusZero(arr[2]);
	}
	int calDuration(String begin,String end){	//计算相隔时间
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
	<div id="greybg"></div>
	<div id="header">
		<div id="back"><p><</p></div>
		<div id="text"><p>全部订单</p></div>
	</div>
	<div id="none"></div>
	  
	<div class="popup" id="popup">	<!-- 点击删除的弹窗 -->
		<div class="tipText" id="tipText">
			<div class="tip1" id="tip1">删除此订单记录不等于取消预订</div>
			<br>
			<div class="tip2" id="tip2">删除后订单记录无法还原和查询，确定删除吗？</div>
		</div>
		
		<div class="yes" id="yes"><p>删除</p></div>
		<div class="no" id="no"><p>点错了</p></div>
	</div>
	
	<div class="popup" id="popup2">	<!-- 点击删除的弹窗 -->
		<div class="tipText" id="tipText2">
			<div class="tip1" id="tip12">确定取消预订吗？</div>
			<br>
			<div class="tip2" id="tip22">预订退款将退回支付账户</div>
		</div>
		
		<div class="yes" id="yes2"><p>取消预订</p></div>
		<div class="no" id="no2"><p>点错了</p></div>
	</div>
	
	
	
	
	<div id="body">
		<%for(int i=0;i<sumOrder;i++){ 
			 if(status.get(i).equals("已成交")){ 
				out.print("<div class='order order1' id='order"+i+"'>");
			}else if(status.get(i).equals("已取消")){
				out.print("<div class='order order2' id='order"+i+"'>");
			}else{
				out.print("<div class='order order3' id='order"+i+"'>");
			} 
		
			out.print("<div class='hotelName' id='hotelName"+i+"'><p>"+hotelName.get(i)+"</p></div>");
		%>
			<div class="time"><p><%=dateType(s_day.get(i)) %>至<%=dateType(e_day.get(i)) %> <%=calDuration(s_day.get(i), e_day.get(i)) %>晚</p></div>
			<div class="roomNum"><p><%=roomNum.get(i) %>间</p></div>
		<%	out.print("<div id='number"+i+"'>"+orderNum.get(i)+"</div>");
			out.print("<div class='button delete' id='delete"+i+"'><p>删除</p></div>");
		 	if(status.get(i).equals("已确认")){	
			out.print("<div class='button booking' id='booking"+i+"'><p>取消预订</p></div>");
			}else{
			out.print("<div class='button booking' id='booking"+i+"'><p>再次预订</p></div>");
			} %>
			<div id="mess">
				<p class="price">￥<%=price.get(i) %></p>
				<%out.print("<p class='status' id='status"+i+"'>"+status.get(i)+"</p>"); %>
			</div>
		</div>
		<%} %>
	</div>
	<%String id=(String)session.getAttribute("id1");%>
	<input type="hidden" id="id1" value=<%=id %>>
	<script type="text/javascript">
		$("#back").click(function() {
			window.location.href="订酒店.jsp";
		})
	</script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script type="text/javascript" src="js/myOrder1.js"></script>
	
	

	
	
	
	
	


	
</body>
</html>