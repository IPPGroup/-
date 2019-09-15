<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.ArrayList,hotel.Dao,java.text.SimpleDateFormat,java.util.*,java.time.format.DateTimeFormatter,java.time.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>酒店</title>
	 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet"  href="<%=request.getContextPath() %>/css/酒店.css">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
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
    <style type="text/css">
		body, html,#allmap {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:300px;width:100%;}
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rnGqVhxOr6hD8F5IE1pvFCZ7wpBVigPE"></script>
</head>
<body>
	<%ArrayList userlist=(ArrayList)session.getAttribute("userlist");
	String id=request.getParameter("id");
	Dao user1=(Dao)userlist.get(Integer.valueOf(id)-1);
	%>
<h1 align="center"><%=user1.getName()%>具体信息</h1>
	<form action="订酒店" method="post">
    <div class="back1">
    		<hr>
            <div class="back" >
                <input type="submit" value="返回" class="word_in_back">
            </div>
            <div class="back">
            	<a href="#style" class="word_in_back">查看房型</a>
            </div>
            <hr>
        </div>
        </form>
        <%
 String Url="jdbc:mysql://127.0.0.1:3306/hotel";
 String user="root";
 String password="88939668";
 int flag=0;
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection(Url, user, password);
	String s1=user1.getName();
	HttpSession session1 = request.getSession();
	session1.setAttribute("identity", id);
	String sql1="select * from hotelroom,roominfo where hotelroom.name='"+s1+"' and hotelroom.name=roominfo.hotelname;";
	PreparedStatement pstm1 = con.prepareStatement(sql1);
	ResultSet result1 = pstm1.executeQuery();
	Dao userdao[]=new Dao[100];
	while(result1.next()) {
		userdao[flag]=new Dao(result1.getString("name"),result1.getString("simpleinfo"),result1.getString("detailedinfo"),
				result1.getString("src"),result1.getDouble("value"),result1.getString("roomstyle"),result1.getDouble("roomvalue"),
				result1.getInt("number"),result1.getString("roomsrc"),result1.getString("info"));
		flag++;
	}
%>
<div class="all">
<div class="banner">
    <ul class="img">
    <%String s4=user1.getScrollsrc();
    String[] se=s4.split(",");%>
        <li><img class="scrollimg" src="img/scroll1.jpg"/></li>
        <li><img class="scrollimg" src="img/scroll2.jpg"/></li>
        <li><img class="scrollimg" src="img/scroll3.jpg"/></li>
        <li><img class="scrollimg" src="img/scroll4.jpg"/></li>
    </ul>
</div>


<div id="l-map"></div>
	<div><input type="text" id="search" value=<%=user1.getName() %>></div>
	<h3 id="bar"></h3>
	<div id="r-result"></div>
<hr>
<div >
	<p class="detailed"><%=user1.getDetailedinfo()%></p>
</div>
<hr>
<%  LocalDate s_day; 
		LocalDate e_day;
		int duration;		
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");		
		String begin=request.getParameter("s_day");		//从select得值
		String end=request.getParameter("e_day");
		String begin_day=null;	//用于传值给calendar
		String end_day=null;
		
		if(begin==null){		
			s_day=LocalDate.now(); 
			e_day=s_day.plusDays(1);
			duration=1;
		}else{
			s_day=LocalDate.parse(begin,df);
			e_day=LocalDate.parse(end,df);
			duration=calDuration(begin, end);
		}
		
		begin_day=s_day.toString();
		end_day=e_day.toString();
		Cookie s=new Cookie("s_day",begin_day);
		Cookie e=new Cookie("e_day",end_day);
		s.setMaxAge(24*60*60);
		e.setMaxAge(24*60*60);
		response.addCookie(s);
		response.addCookie(e);		
 	%>
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
	<div id="main">
		<div id="start" class="sub">
			<p class="date"><% out.print(s_day); %></p>
		</div>
		<div id="duration" class="sub">
			<p id="days"><% out.print(duration+"晚"); %></p>
		</div>
		<div id="end" class="sub">
			<p class="date"><% out.print(e_day); %></p>
		</div>
		<%String date=s_day+","+e_day;
		session.setAttribute("date", date); %>
	</div>	
<script src="./js/link1.js"></script>
<a name="style"></a>
<% for (int i=0;i<flag;i++){%>
<div class="thr_top1">
        <img src=<%=userdao[i].getRoomsrc() %> style="margin-top:10px;
	margin-bottom: -60px;">
        <p><%=userdao[i].getRoomstyle() %></p>
        <p class="info"><%=userdao[i].getInfo() %></p>
        <p class="money" style="color:grey">¥<span style="color:orange"><%=userdao[i].getRoomvalue()%></span>元/天</p>
        <%String f= id+","+String.valueOf(i+1); %>
        <a class="order" href="bookingPage.jsp?id=<%=f %>" >
        <p ><span class="order1">   预订   </span></p>
        </a>
</div>
   <%} %>	

</div>
	<div class="second">
	<ul>
		<div class="sec_block"><a class="sec_title" href="myOrder.jsp">我的订单</a></div>
		<div class="sec_block"><a class="sec_title" href="#">点击收藏</a></div>	
	</ul>			
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");   
	// 创建Map实例
	function myFun(result){
		var cityName = result.name;		
		document.getElementById('bar').value=cityName;
	map.centerAndZoom(document.getElementById('bar').value, 13);
	console.log(document.getElementById('bar').value);
	var myKeys = [document.getElementById('search').value];
	console.log(myKeys);
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map, panel:"r-result"},
		pageCapacity:5
	});
	local.searchInBounds(myKeys, map.getBounds());
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>
