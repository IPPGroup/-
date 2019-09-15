var destination=document.getElementById("destination");
var box=document.getElementById("box");
var helper=document.getElementById("helper");
var MainPage=document.getElementById("MainPage");
var ClientPage=document.getElementById("ClientPage");


function open_destination(){
	window.location.href="destination.jsp";
}
function open_box(){
	window.location.href="box.jsp";
}
function open_helper(){
	window.location.href="helper.jsp";
}
function open_MainPage(){
	window.location.href="旅游小程序.jsp";
}
function open_ClientPage(){
	window.location.href="#";
}
destination.onclick=open_destination;
box.onclick=open_box;
helper.onclick=open_helper;
MainPage.onclick=open_MainPage;
ClientPage.onclick=open_ClientPage;