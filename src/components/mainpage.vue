	<template>
		<v-card>
		<v-app-bar color="#375D9B" height="200">
			
		<v-toolbar-title >全域旅游营销服务平台企业端</v-toolbar-title>
		<v-spacer></v-spacer>
		<v-spacer></v-spacer>
		<v-spacer></v-spacer>
		<v-spacer></v-spacer>
		
		<v-row>
			<v-col cols="12" sm="10">
		<div  class="ma-2">
			<v-btn  color="#375D9B" dark depressed>
					<v-icon dark left>mdi-account-question-outline</v-icon>Help
			</v-btn>
		</div>
		<div class="ma-2">
			<v-btn color="#375D9B"  depressed>
				<v-icon left color="white">mdi-alarm</v-icon>
				{{dateFormat(date)}}
			</v-btn>
		</div>
		
			<v-btn color="#375D9B" class="ma-2"  depressed>
				<v-icon left>mdi-account-circle-outline</v-icon>{{administater}}
			</v-btn>
			<v-btn  class="ma-2" color="#375D9B" dark  @click.stop="logout = true"  depressed>
					<v-icon></v-icon>注销
			</v-btn>
		</v-col>
			<v-dialog
				v-model="logout"
				max-width="290"
				>
				<v-card>
					<v-card-title class="confirm">是否注销？</v-card-title>
			
					<v-card-text>
					正在执行注销用户操作
					</v-card-text>
			
					<v-card-actions>
					<v-spacer></v-spacer>
			
					<v-btn
						color="primary"
						@click="logout = false"
					>
						不注销
					</v-btn>
			
					<v-btn
						color="error"
						@click="logout = false"
					>
						注销
					</v-btn>
					</v-card-actions>
				</v-card>
				</v-dialog>
				
					
					
			
			</v-row>
		
		</v-app-bar>
		</v-card>
	</template>
	<script>
		export default{
			data() {return{
				date:new Date(),
				administater:'嵊县姚少',
				logout:false,
				};
						
					},
					mounted () {
						var _this = this; //声明一个变量指向vue实例this,保证作用域一致
						this.timer = setInterval(function() {
							_this.date = new Date();//修改数据date
						}, 1000);
					},
					beforeDestroy () {
						if(this.timer) {
							clearInterval(this.timer);//在vue实例销毁钱，清除我们的定时器
						}
					},
					methods:{
						//时间格式化函数，此处仅针对yyyy-MM-dd hh:mm:ss 的格式进行格式化
						dateFormat(time) {
							var date=new Date(time);
							var year=date.getFullYear();
							/* 在日期格式中，月份是从0开始的，因此要加0
							 * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
							 * */
							var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
							var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
							var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
							var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
							var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
							// 拼接
							return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
						}
					}
		}
	</script>
	<style>
		.v-toolbar__title {
			font-size: 40px !important;	
			padding: 0 !important;
			-webkit-box-reflect: below -1px -webkit-linear-gradient(top, transparent, transparent 10%, rgba(0, 0, 0, 0.296875)) !important;
			color: white !important;
		}
	</style>