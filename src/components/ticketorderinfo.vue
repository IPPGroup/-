<template>
	<v-card>
		<router-view></router-view>
		<v-row>
			<v-col cols="6">
				<v-card color="#EFEFED">
					<v-list-item >
						<v-list-item-title class="headline mb-1" >
							<br />
						<p class="font-weight-black ">订单编号  :{{details.hotelID}}</p>
						
						<p class="font-weight-black ">下单时间  :{{details.hotelID}}</p>
						
					
						<P class="font-weight-black ">有效使用时间  :{{details.hotelID}}</p>
						
						<P class="font-weight-black ">支付状态  :{{details.hotelID}}</p>
					
						<P class="font-weight-black ">使用状态  :{{details.hotelID}}</p>
					
						<P class="font-weight-black ">评论状态  :{{details.hotelID}}<v-btn color="#375D9B" >点击查看</v-btn></p>
						
						</v-list-item-title>
					</v-list-item>
					<br />
					<v-divider  :inset="inset"></v-divider>
					<br />
					<v-list-item>
						
						<v-list-item-title>
							<p class="font-weight-black ">产品编号  :{{details.hotelID}}<v-btn color="#375D9B" @click="goshowspot()">点击查看产品</v-btn></p>
							
							<p class="font-weight-black ">用户编号  :{{details.hotelID}}</p>
							
												
							<P class="font-weight-black ">用户名  :{{details.hotelID}}</p>
						</v-list-item-title>
					</v-list-item>
				</v-card>
			</v-col>
			<v-col cols="6">
				<v-spacer></v-spacer>
				<v-btn @click="goticketorder()" color="primary">返回</v-btn>
			</v-col>
		</v-row>
	</v-card>
</template>

<script>
	export default{
		data(){
			return {
				details:null,
				items:[
					{id:'11111'}
				]
			}
		},
		created:function(){
			this.getQuerys();
		},
		watch:{
			'$router':'getQuery',
			
		},
		methods:{
			getQuerys:function(){
				this.details = this.$route.query
				this.textareText = this.details
			},
			
			goticketorder(){
				this.$router.push('/mainpage/ticketorder')
			},
			goshowspot(){
				this.$router.push('/mainpage/showspot')
			},
			
		}
	}
</script>

<style scoped>
	.font-weight-black {
		color:#375D9B !important;
		font-size: 23px;
	}
	.v-btn{
		margin-left: 10px;
	}
</style>
