
$(function (){
$(".input").focus(function(){
  $(".delete-icon").css({"opacity":"1"});
});
$(".input").blur(function(){
  $(".delete-icon").css({"opacity":"0"});
})
});
$(".delete-icon").click(function(){
  $(".input").val("");
})
$(function(){
		var str=localStorage.historyItems;
		var s = '';
		if(str==undefined){
			$(".history-tab").html('暂无历史记录...')
		}else{
			var strs= new Array();
			strs=str.split("|");
			for(var i=0;i<strs.length;i++){
				s+= "&nbsp"+"&nbsp"+"<a href='/search?keyword="+strs[i]+"'>"+strs[i]+"</a>";
			}
			$(".history-tab").append(s);
		}
		$(".search-button input").on("click",function(){
			if($('.input').val()==''){
				hint("搜索",1500)
			}else{
//			请求接口成功跳转
				location.href='../views/='+$('.input').val()+'.html';
				var keyword=$('.input').val();
				setHistoryItems(keyword);
			}
		});
		$(".clear-button").on("click",function(){
//		请求接口成功清除
			$(".history-tab").empty();
			clearHistory();
		})
		var isOpen=true,page=0;

	})
	//存值方法,新的值添加在首位
	function setHistoryItems(keyword) {
		let { historyItems } = localStorage;
		if (historyItems === undefined) {
			localStorage.historyItems = keyword;
		} else {
			historyItems = keyword + '|' + historyItems.split('|').filter(e => e != keyword).join('|');
			localStorage.historyItems = historyItems;
		}
	}
	//清除值
	function clearHistory() {
		localStorage.removeItem('historyItems');
		$(".history-text").html('暂无历史记录...')
		var div = document.getElementsByClassName(".history-tab");
		/*while(div.hasChildNodes()) //当div下还存在子节点时 循环继续
		{
			div.removeChild(div.firstChild);
		}*/
		// $("#lssslb").append('<div class="rmssts">暂无搜索记录...</div>');
		window.location.reload();
	}
