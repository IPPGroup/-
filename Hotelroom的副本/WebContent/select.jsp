<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String id=(String)session.getAttribute("identity");%>
<form action="酒店.jsp?id=<%=id%>" method="post" name="fm1" id="fm1">
	<input type="hidden" id="s_day" name="s_day">
	<input type="hidden" id="e_day" name="e_day">
</form>

<script type="text/javascript">
	window.onload=function(){
		var chooseColor="#ff4040";
		var white="#ffffff";
		
		var get=document.getElementsByClassName("dayblock");	//只选日期
		
		var day=new Date();
		var today=day.getFullYear()+"-"+plusZero(day.getMonth()+1)+"-"+plusZero(day.getDate());
		
		var s_day='<%=session.getAttribute("s_day")%>';	
		var e_day='<%=session.getAttribute("e_day")%>';	
		//s_day与e_day均为id模式
		document.getElementById(s_day).style.backgroundColor=chooseColor;
		document.getElementById(e_day).style.backgroundColor=chooseColor;
		var betweenDays=plusDay(s_day);
		while(compareDay(dateType(e_day),dateType(betweenDays))){
			document.getElementById(betweenDays).style.backgroundColor='#FF83FA';
			betweenDays=plusDay(betweenDays);
		}			
		var times=0;
		
		for(var i=0;i<get.length;i++){
			get[i].onclick=function(){
				if(!compareDay(today,dateType(this.id))){	//只能点击今天及以后的日期
					if(times==0){	//第一次点击
						document.getElementById(s_day).style.backgroundColor=white;
						document.getElementById(e_day).style.backgroundColor=white;
						var betweenDays=plusDay(s_day);
						while(compareDay(dateType(e_day),dateType(betweenDays))){
							document.getElementById(betweenDays).style.backgroundColor=white;
							betweenDays=plusDay(betweenDays);
						}	
						this.style.backgroundColor=chooseColor;			
						s_day=this.id;
						times++;
					}else if(times==1){		//第二次点击，即已经存在起始日
						if(compareDay(dateType(s_day),dateType(this.id))){	//如果起始日大于选择日
							document.getElementById(s_day).style.backgroundColor=white;
							s_day=this.id;	//重新定义起始日
							document.getElementById(s_day).style.backgroundColor=chooseColor;
						}else if(s_day==this.id){	//如果起始日与当前点中的日期相等
						}else{
							e_day=this.id;	//定义结束日
							document.getElementById(e_day).style.backgroundColor=chooseColor;
							var betweenDays=plusDay(s_day);
							while(compareDay(dateType(e_day),dateType(betweenDays))){
								document.getElementById(betweenDays).style.backgroundColor='#FF83FA';
								betweenDays=plusDay(betweenDays);
								document.getElementById(betweenDays).classList.add("betweenDays");
							}		
							setTimeout(function(){window.location.href="旅游小程序.jsp";},1500);	
							document.getElementById("s_day").value=dateType(s_day);
							document.getElementById("e_day").value=dateType(e_day);
							setTimeout(function() {fm1.submit();},1500);
							

						}
					}					
				}
					
			}
		}
	}
	
	function plusZero(str){	//个位数添加0
		if(str<10){
			str='0'+str;
		}
		return str;
	}
	
	function compareDay(date1,date2) {	//比较日期，前者大为true
		var Date1 = new Date(date1);
		var Date2 = new Date(date2);
		if(Date1.getTime() > Date2.getTime()){
		    return true;
		} else {
			return false;
		}
	}
	
	function idType(str){	//将日期转为id
		var arr=str.split("-");
		if(arr[1].substring(0,1)=="0"){
			arr[1]=arr[1].substring(1,2);
		}
		if(arr[2].substring(0,1)=="0"){
			arr[2]=arr[2].substring(1,2);
		}
		return arr[0]+"-"+arr[1]+"-"+arr[2];
	}
	function dateType(str) {	//将id转为日期
		var arr=str.split("-");
		return arr[0]+"-"+plusZero(arr[1])+"-"+plusZero(arr[2]);
	}
	
	function plusDay(str){	//加一天
		var arr=str.split("-");	
		var month=[0,31,28,31,30,31,30,31,31,30,31,30,31];
		if(isLeapYear(arr[0])){
			month[2]=29;
		}
		arr[2]++;
		if(arr[2]>month[Number(arr[1])]){	//超出日数上限		
			arr[2]=1;
			arr[1]++;		
		}
		if(arr[1]>12){
			arr[1]=1;
			arr[0]++;
		}
		return arr[0]+"-"+arr[1]+"-"+arr[2];
	}
	
	function isLeapYear(yy){	//判断是否闰年
		if((yy%4==0&&yy%100!=0)||yy%400==0){
			return true;
		}else{
			return false;
		}
	}

</script>