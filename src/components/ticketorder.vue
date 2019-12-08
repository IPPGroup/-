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
		<v-col v-for="order in orders"  :key="order.OrderId"  :cols="4">
		<v-card>
		<v-card-text>
			<div>景区门票</div>
			<p class="display-1 text--primary">
			{{order.TicketKind}}
			</p>
			<p>细则</p>
			<div class="text--primary">
			订单编号:{{order.OrderId}}<br>
			下单时间:{{order.OrderDate}}<br />
			用户编号:{{order.UserId}}
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
					{OrderId:10000,ScenicId:10005,UserId:'100086',TicketKind:'成人票',OrderDate:'2019-11-6'},
					{OrderId:10001,ScenicId:10004,UserId:'10000',TicketKind:'儿童票',OrderDate:'2019-11-20'},
					{OrderId:10002,ScenicId:10003,UserId:'1000005',TicketKind:'家庭票',OrderDate:'2019-11-30'},
					{OrderId:10003,ScenicId:10002,UserId:'406',TicketKind:'成人票',OrderDate:'2019-12-1'},
					{OrderId:10004,ScenicId:10001,UserId:'315',TicketKind:'儿童票',OrderDate:'2019-1-1'},
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
