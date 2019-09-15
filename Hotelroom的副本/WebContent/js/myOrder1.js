var popup2=$("#popup2");
var yes2=$("#yes2");
var no2=$("#no2");
var greybg=$("#greybg");
var body=$("body");
var id1=$("#id1");
popup2.hide();
greybg.hide();
/*********再次预订&取消预订************/
$(".booking").click(function(){
	var current=lastWord(this.id);	//获取当前订单排序（0开始）
	var bookingId=$("#booking"+current);	//获取id
	if(bookingId.children().text()=="再次预订"){
		window.location.href="酒店.jsp?id="+id1.val();
	}else{
		popup2.show();
		greybg.show();
		body.css("overflow","hidden");	
		yes2.click(function(){	//确定
			popup2.hide();
			greybg.hide();
			body.css("overflow","visible");
			$("#order"+current).removeClass("order3");
			$("#order"+current).addClass("order2");
			$(".order2 p").css("color","#b3bfcf");
			$(".order2 .button p").css("color","#3c93da");
			bookingId.children().text("再次预订");
			$("#status"+current).text("已取消");
			window.location.href="myOrder.jsp?cancel="+$("#number"+current).text();
		});
		no2.click(function(){	//点错了
			popup2.hide();
			greybg.hide();
			body.css("overflow","visible");
		});
	}
});



$(".order2 p").css("color","#b3bfcf");
$(".order2 .button p").css("color","#3c93da");

function lastWord(str){		//返回最后一个字符
	return str.substring(str.length-1,str.length);
}




