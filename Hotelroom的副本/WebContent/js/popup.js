/************弹窗事件*********/
var popup=$("#popup");
var yes=$("#yes");
var no=$("#no");
var greybg=$("#greybg");
var body=$("body");
var $delete=$(".delete");
var current=-1;
popup.hide();
greybg.hide();



$delete.click(function(){
	current=lastWord(this.id);
	popup.show();
	greybg.show();
	body.css("overflow","hidden");
	
});
yes.click(function(){	//删除
	popup.hide();
	greybg.hide();
	body.css("overflow","visible");
	window.location.href="myOrder.jsp?delete="+$("#number"+current).text();
	
});
no.click(function(){	//点错了
	popup.hide();
	greybg.hide();
	body.css("overflow","visible");
})

function lastWord(str){		//返回最后一个字符
	return str.substring(str.length-1,str.length);
}


