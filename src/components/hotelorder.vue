<template>
	<v-card
		width="100%" color="#EFEFED"
	>
	<v-container fluid>
		<v-col cols="12" sm="12">
			<v-autocomplete  :items="components" label="search" outlined clearable></v-autocomplete>
				<v-btn  class="ma-2"  color="blue darken-2"   large :loading="loading"  :disabled="loading" @click="loader = 'loading'">
					<v-icon dark left>
						mdi-magnify
					</v-icon>搜索
				</v-btn>
		</v-col>
	<v-row>
		<v-col v-for="order in orders"  :key="order.UserId"  :cols="4">
		<v-card>
		<v-card-text>
			<div>酒店订单</div>
			<p class="display-1 text--primary">{{order.hotelname}}</p>
			<p class="headline text--primary">
			{{order.TicketKind}}
			</p>
			<p>细则</p>
			<div class="text--primary">
			订单编号:{{order.pnumber}}<br>
			下单时间:{{order.ordertime}}<br />
			用户编号:{{order.UserId}}<br />
			支付方式:{{order.status}}
			</div>
		</v-card-text>
		<v-card-actions>
			<v-btn
				color="primary"
				>
				详细信息
			</v-btn>
			<v-spacer></v-spacer>
			<v-btn
			color="deep-purple accent-4"
			>
			核销该订单
		</v-btn>
		</v-card-actions>
		</v-card>
		</v-col>
		</v-row>
		</v-container>
	</v-card>
		
</template>

<script>
	export default{
		data(){
			return{
				loader: null,
				loading: false,
				confirm: false,
				detail:false,
				orders:[
					{pnumber:'H10000000000',UserId:'100086',hotelname:'华美达酒店',s_day:'2019-11-7',e_day:'2019-11-11',status:'支付宝',ordertime:'2019-11-6'},
					{pnumber:'H10000000000',UserId:'100086',hotelname:'华美达酒店',s_day:'2019-11-7',e_day:'2019-11-11',status:'支付宝',ordertime:'2019-11-6'},
					{pnumber:'H10000000000',UserId:'100086',hotelname:'华美达酒店',s_day:'2019-11-7',e_day:'2019-11-11',status:'支付宝',ordertime:'2019-11-6'},
					{pnumber:'H10000000000',UserId:'100086',hotelname:'华美达酒店',s_day:'2019-11-7',e_day:'2019-11-11',status:'支付宝',ordertime:'2019-11-6'},
					],
				components: [
					'10000', '10001', '10002', '10003', '10004', '成人票', '100086', '家庭票', '儿童票', '2019-1-1',
					],
					
			}
		},
		watch: {
			loader () {
				const l = this.loader
				this[l] = !this[l]
		
				setTimeout(() => (this[l] = false), 2000)
		
				this.loader = null
			},
			},
	}
</script>

<style>
	.custom-loader {
		animation: loader 1s infinite;
		display: flex;
	}
	.v-btn__content{
		color: white;
	}
	@-moz-keyframes loader {
		from {
		transform: rotate(0);
		}
		to {
		transform: rotate(360deg);
		}
	}
	@-webkit-keyframes loader {
		from {
		transform: rotate(0);
		}
		to {
		transform: rotate(360deg);
		}
	}
	@-o-keyframes loader {
		from {
		transform: rotate(0);
		}
		to {
		transform: rotate(360deg);
		}
	}
	@keyframes loader {
		from {
		transform: rotate(0);
		}
		to {
		transform: rotate(360deg);
		}
	}
</style>

