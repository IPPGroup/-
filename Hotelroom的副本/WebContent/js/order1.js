function show(){
	var pingpai=document.getElementById("pingpai");
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var myTable=document.getElementById("myTable");
	var shaixuan=document.getElementById("shaixuan");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var chongzhichakan = document.getElementById("chongzhichakan");
	var button=document.getElementById("button");
	var button1 = document.getElementById("button1");
	if(myTable.style.display=="none"){
		 myTable.style.display="block";
		 shaixuan.style.display="none";
		 pingpai.style.display="none";
		 jingji.style.display="none";
		 shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		 fangxingzaocan.style.display="none";
		 fangxing.style.display="none";
		 zaocan.style.display="none";
		 zhuti.style.display="none";
		 chongzhichakan.style.display="none";
		 button.value="价格/星级⬇️";
		 button1.value="筛选⬆️";
		}	
	else if(myTable.style.display=="block"){
		 myTable.style.display ="none";
		 button.value="价格/星级⬆️";
		 pingpai.style.display="none";
		 jingji.style.display="none";
		 shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		 fangxingzaocan.style.display="none";
		 fangxing.style.display="none";
		 zaocan.style.display="none";
		 zhuti.style.display="none";
		 chongzhichakan.style.display="none";
		}
}
function show1(){
	var pingpai=document.getElementById("pingpai");
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var button=document.getElementById("button");
	var myTable = document.getElementById("myTable");
	var shaixuan = document.getElementById("shaixuan");
	var chongzhichakan = document.getElementById("chongzhichakan");
	var button1 = document.getElementById("button1");
	if(shaixuan.style.display=="none"){
		shaixuan.style.display="block";
		jingji.style.display="block";
		shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		myTable.style.display="none";
		pingpai.style.display="block";
		fangxingzaocan.style.display="none";
		 fangxing.style.display="none";
		 zaocan.style.display="none";
		 zhuti.style.display="none";
		 chongzhichakan.style.display="block";
		button1.value="筛选⬇️";
		button.value="价格/星级⬆️️";
	}
	else if(shaixuan.style.display=="block"){
		shaixuan.style.display="none";
		button1.value="筛选⬆️";
		pingpai.style.display="none";
		jingji.style.display="none";
		shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		 fangxingzaocan.style.display="none";
		 fangxing.style.display="none";
		 zaocan.style.display="none";
		 zhuti.style.display="none";
		 chongzhichakan.style.display="none";
	}
}
function show2(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var pingpai=document.getElementById("pingpai");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var button3=document.getElementById("button3");
	var button8=document.getElementById("button8");
	var button9=document.getElementById("button9");
	var button10=document.getElementById("button10");
	button3.style.color="#ffe29c";
	button8.style.color="black";
	button9.style.color="black";
	button10.style.color="black";
	if(pingpai.style.display=="none"){
		pingpai.style.display="block";
		if(button3.name=="pingpai"){
			jingji.style.display="block";
			shushi.style.display="none";
			 gaodang.style.display="none";
			 haohua.style.display="none";
			 fangxingzaocan.style.display="none";
			 fangxing.style.display="none";
			 zaocan.style.display="none";
			 zhuti.style.display="none";
		}
		else if(button3.name=="pingpai2"){
			jingji.style.display="none"
			shushi.style.display="block";
		 	gaodang.style.display="none";
		 	haohua.style.display="none";
		 	fangxingzaocan.style.display="none";
		 	fangxing.style.display="none";
		 	zaocan.style.display="none";
		 zhuti.style.display="none";
		}
		else if(button3.name=="pingpai3"){
			jingji.style.display="none"
			shushi.style.display="none";
		 	gaodang.style.display="block";
		 	haohua.style.display="none";
		 	fangxingzaocan.style.display="none";
		 	fangxing.style.display="none";
		 	zaocan.style.display="none";
		 zhuti.style.display="none";
		}
		else if(button3.name=="pingpai4"){
			jingji.style.display="none"
			shushi.style.display="none";
		 	gaodang.style.display="none";
		 	haohua.style.display="block";
		 	fangxingzaocan.style.display="none";
		 	fangxing.style.display="none";
		 	zaocan.style.display="none";
		 zhuti.style.display="none";
		}
	}
}
function show3(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var button3=document.getElementById("button3");
	var button4=document.getElementById("button4");
	var button5=document.getElementById("button5");
	var button6=document.getElementById("button6");
	var button7=document.getElementById("button7");
	button4.style.color="#ffe29c";
	button5.style.color="black";
	button6.style.color="black";
	button7.style.color="black";
	if(jingji.style.display=="none"){
		jingji.style.display="block";
		shushi.style.display="none";
		gaodang.style.display="none";
		haohua.style.display="none";
		button3.name="pingpai";
	}
}
function show4(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var button3=document.getElementById("button3");
	var button4=document.getElementById("button4");
	var button5=document.getElementById("button5");
	var button6=document.getElementById("button6");
	var button7=document.getElementById("button7");
	button4.style.color="black";
	button5.style.color="#ffe29c";
	button6.style.color="black";
	button7.style.color="black";
	if(shushi.style.display=="none"){
		shushi.style.display="block";
		button3.name="pingpai2";
		jingji.style.display="none";
		gaodang.style.display="none";
		haohua.style.display="none";
	}
}
function show5(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var button3=document.getElementById("button3");
	var button4=document.getElementById("button4");
	var button5=document.getElementById("button5");
	var button6=document.getElementById("button6");
	var button7=document.getElementById("button7");
	button4.style.color="black";
	button5.style.color="black";
	button6.style.color="#ffe29c";
	button7.style.color="black";
	if(gaodang.style.display=="none"){
		jingji.style.display="none";
		shushi.style.display="none";
		gaodang.style.display="block";
		haohua.style.display="none";
		button3.name="pingpai3"
	}
}
function show6(){

	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var button3=document.getElementById("button3");
	var button4=document.getElementById("button4");
	var button5=document.getElementById("button5");
	var button6=document.getElementById("button6");
	var button7=document.getElementById("button7");
	button4.style.color="black";
	button5.style.color="black";
	button6.style.color="black";
	button7.style.color="#ffe29c";
	if(haohua.style.display=="none"){
		haohua.style.display="block";
		jingji.style.display="none";
		shushi.style.display="none";
		gaodang.style.display="none";
		button3.name="pingpai4"
	}
}
function show7(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var pingpai=document.getElementById("pingpai");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var button3=document.getElementById("button3");
	var button8=document.getElementById("button8");
	var button9=document.getElementById("button9");
	var button10=document.getElementById("button10");
	button3.style.color="black";
	button8.style.color="#ffe29c";
	button9.style.color="black";
	button10.style.color="black";
	if(fangxingzaocan.style.display=="none"){
		pingpai.style.display="none";
		jingji.style.display="none";
		shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		 fangxingzaocan.style.display="block";
		 if(button8.name=="fangzao"){
		 fangxing.style.display="block";
		 zaocan.style.display="none";
		 zhuti.style.display="none";
		 }
		 else if(button8.name=="fangzao2"){
			 fangxing.style.display="none";
			 zaocan.style.display="block";
			 zhuti.style.display="none";
		 }
	}
}
function show8(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var pingpai=document.getElementById("pingpai");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var button3=document.getElementById("button3");
	var button8=document.getElementById("button8");
	var button9=document.getElementById("button9");
	var button10=document.getElementById("button10");
	button3.style.color="black";
	button8.style.color="black";
	button9.style.color="#ffe29c";
	button10.style.color="black";
	if(zhuti.style.display=="none"){
		pingpai.style.display="none";
		jingji.style.display="none";
		shushi.style.display="none";
		 gaodang.style.display="none";
		 haohua.style.display="none";
		 fangxingzaocan.style.display="none";
		 fangxing.style.display="none";
		 zaocan.style.display="none";
		 zhuti.style.display="block";
	}
}
function show10(){
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var button8=document.getElementById("button8");
	var button11=document.getElementById("button11");
	var button12=document.getElementById("button12");
	button12.style.color="black";
	button11.style.color="#ffe29c";
	if(fangxing.style.display=="none"){
		fangxing.style.display="block";
		zaocan.style.display="none";
		button8.name="fangzao";
	}
}
function show11(){
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var button8=document.getElementById("button8");
	var button11=document.getElementById("button11");
	var button12=document.getElementById("button12");
	button11.style.color="black";
	button12.style.color="#ffe29c";
	if(zaocan.style.display=="none"){
		fangxing.style.display="none";
		zaocan.style.display="block";
		button8.name="fangzao2";
	}
}
function show12(){
	var jingji=document.getElementById("jingji");
	var shushi=document.getElementById("shushi");
	var gaodang=document.getElementById("gaodang");
	var haohua=document.getElementById("haohua");
	var pingpai=document.getElementById("pingpai");
	var fangxingzaocan=document.getElementById("fangxingzaocan");
	var fangxing=document.getElementById("fangxing");
	var zaocan=document.getElementById("zaocan");
	var zhuti=document.getElementById("zhuti");
	var button3=document.getElementById("button3");
	var button4=document.getElementById("button4");
	var button5=document.getElementById("button5");
	var button6=document.getElementById("button6");
	var button7=document.getElementById("button7");
	var button8=document.getElementById("button8");
	var button9=document.getElementById("button9");
	var button10=document.getElementById("button10");
	var button11=document.getElementById("button11");
	var button12=document.getElementById("button12");
	button3.style.color="#ffe29c";
	button4.style.color="#ffe29c";
	button11.style.color="#ffe29c";
	button5.style.color="black";
	button6.style.color="black";
	button7.style.color="black";
	button8.style.color="black";
	button9.style.color="black";
	button10.style.color="black";
	button12.style.color="black";
	pingpai.style.display="block";
	jingji.style.display="block";
	shushi.style.display="none";
	gaodang.style.display="none";
	haohua.style.display="none";
	fangxingzaocan.style.display="none";
	fangxing.style.display="none";
	zaocan.style.display="none";
	zhuti.style.display="none";
}