var roomNum=1.00;
var bookingMess=$("#bookingMess");
var guestName=$("#guestName");
var money=$("#money");
var money2=$("#money2");
var add='<input type="text" name="name" placeholder="姓名，每间只需填写1人">';
$("select").change(function(){	
	roomNum=$(this).find("option:selected").val();
	bookingMess.css("height",202+101*roomNum+"px");
	guestName.css("height",100*roomNum+"px");
	guestName.html('<div id="guestName" class="mess"><p>住客姓名</p></div><input type="text" name="name" placeholder="姓名，每间只需填写1人">')
    money.attr("placeholder",parseFloat(roomNum*money2.val()));
	for(var i=1;i<roomNum;i++){
		guestName.append(add);
	}
});
