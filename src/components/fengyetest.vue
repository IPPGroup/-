	<template id="template_pagination">
		<div>
			<div id="app">
				<div class="container">
					<h1>  Vue 分页组件 </h1>
					<pagination :total="total" :current.sync="current" v-on:pagechange="pagechange"></pagination>
					<pre>{{ $data|json }}</pre>
					<pre>{{ current }}</pre>
				</div>
			</div>
		
		
			<div id="app01">
				<div class="container">
					<h1>  Vue 分页组件 </h1>
					<pagination :total="total" :current.sync="current" v-on:pagechange="pagechange"></pagination>
					<pre>{{ $data|json }}</pre>
					<pre>{{ current }}</pre>
					<code>sasasasas</code>
				</div>
			</div>
		</div>
	</template>

	<script>
		import Vue from 'vue'
		new Vue({
				el: '#app',
				data: {
					total: 81,     // 记录总条数
					display: 10,   // 每页显示条数
					current: 1     // 当前第n页 ， 也可以 watch current 的变化
				},
				methods: {
					pagechange: function (p) {
						this.current = p;// 页码改变event ， p 为新的 current
						//console.log('pagechange', p);
					}
				}
			});
		
			new Vue({
				el: '#app01',
				data: {
					total: 81,     // 记录总条数
					display: 10,   // 每页显示条数
					current: 1     // 当前第n页 ， 也可以 watch current 的变化
				},
				methods: {
					pagechange: function (p) {
						this.current = p;// 页码改变event ， p 为新的 current
						//console.log('pagechange', p);
					}
				}
			});
	</script>

	<style>
	</style>

	<script type="text/template" id="template_pagination">
		<nav>
			<ul class="pagination">
				<li :class="{'disabled': current == 1}"><a href="javascript:;" v-on:click="setCurrent(1)"> 首页 </a></li>
				<li :class="{'disabled': current == 1}"><a href="javascript:;" v-on:click="setCurrent(current - 1)"> 上一页 </a></li>
				<li v-for="p in grouplist" :class="{'active': current == p.val}"><a href="javascript:;" v-on:click="setCurrent(p.val)"> {{ p.text }} </a></li>
				<li :class="{'disabled': current == page}"><a href="javascript:;" v-on:click="setCurrent(current + 1)"> 下一页</a></li>
				<li :class="{'disabled': current == page}"><a href="javascript:;" v-on:click="setCurrent(page)"> 尾页 </a></li>
			</ul>
			<ul class="pagination pull-right">
				<li><span> 共 {{ total }}  条数据 </span></li>
				<li><span> 每页显示 {{ display }}  条数据 </span></li>
				<li><span> 共 {{ page }} 页 </span></li>
				<li><span> 当前第 {{ current }} 页 </span></li>
			</ul>
		</nav>
	</script>
	