<template>
		<v-card-text>
		<p class="name text">景点名称：</p>
		<v-text-field v-model="name" placeholder="请输入景区名称" solo></v-text-field>
		<v-text-field v-model="address" placeholder="请输入景区地址" solo></v-text-field>
		<v-text-field v-model="sketch" placeholder="请输入景区简述" solo></v-text-field>
		<v-text-field v-model="phone_num" placeholder="请输入联系电话" solo></v-text-field>
		</v-card-text>
	
</template>

<script>
	export default{
		data(){
			return {
				name:"",
				address:"",
				sketch:"",
				phone_num:"",
			}
		}
	}
</script>

<style>
	.text{
		color:#375d9b;
		font-weight: bold;
		display: inline-block;
	}
	.v-input{
		width: 50%;
		display: inline-block;
	}
</style>
