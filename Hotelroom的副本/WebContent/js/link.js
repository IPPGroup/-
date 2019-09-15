var destination=document.getElementById("destination");
var box=document.getElementById("box");
var helper=document.getElementById("helper");

function open_destination(){
	window.location.href="destination.jsp";
}
function open_box(){
	window.location.href="box.jsp";
}
function open_helper(){
	window.location.href="helper.jsp";
}
destination.onclick=open_destination;
box.onclick=open_box;
helper.onclick=open_helper;

