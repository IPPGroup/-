<template>
	<v-card width="100%" color="#EFEFED">
		
		<v-container fluid>
			<v-col cols="12" sm="12">
				<v-autocomplete  :items="components" label="search" outlined clearable></v-autocomplete>
					<v-btn  class="ma-2"  color="blue darken-2"   large :loading="loading"  :disabled="loading" @click="loader = 'loading'">
						<v-icon dark left>
							mdi-magnify
						</v-icon>搜索
					</v-btn>
			</v-col>
		<v-row dense>
			<v-col v-for="card in cards"  :key="card.title"  :cols="4">
				<v-card >
					<v-img  :src="card.src" class="white--text align-end" gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)" height="200px">
						<v-card-title v-text="card.ScenicId"></v-card-title>
						<v-card-title v-text="card.name"></v-card-title>
					</v-img>
				<v-card-actions>
					<v-btn color="primary" @click="gohotelinfo()">详细信息</v-btn>
					<v-spacer></v-spacer>
					<v-btn color="error" @click.stop="confirm = true">下架信息</v-btn>
				</v-card-actions>
				</v-card>
			</v-col>
			
			<v-dialog v-model="detail" max-width="290">
				<v-card>
					<v-card-title class="detail">酒店具体信息</v-card-title>
						<v-card-text>
							景区编号：XXXXXXXX<br />
							景区名称：XX景区<br />
						</v-card-text>
						<v-card-actions>
							<v-spacer></v-spacer>
						<v-btn color="primary" @click="detail=false" >
							修改信息
						</v-btn>
			
					<v-btn
						color="error"
						@click="detail = false"
					>
						关闭
					</v-btn>
					</v-card-actions>
				</v-card>
				</v-dialog>
			
			<v-dialog
				v-model="confirm"
				max-width="290"
				>
				<v-card>
					<v-card-title class="confirm">是否下架？</v-card-title>
			
					<v-card-text>
					正在执行信息下架操作
					</v-card-text>
			
					<v-card-actions>
					<v-spacer></v-spacer>
			
					<v-btn
						color="primary"
						@click="confirm = false"
					>
						不下架
					</v-btn>
			
					<v-btn
						color="error"
						@click="confirm = false"
					>
						确认下架
					</v-btn>
					</v-card-actions>
				</v-card>
				</v-dialog>
				
			<router-view></router-view>
		</v-row>
		</v-container>
	</v-card>
	
	</template>


	<script>
		export default {
			data () {
				return{
				loader: null,
				loading: false,
				confirm: false,
				detail:false,
				components: [
					'杭州亚朵酒店', '杭州汉庭酒店', '杭州马可波罗酒店', '四季酒店', '酒店1', '酒店2', '酒店3', '酒店4', '酒店5', '酒店6',
					],
			cards: [
				{ScenicId:1,name: '杭州亚朵酒店', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 3 ,point:4.5},
				{ScenicId:2,name: '杭州汉庭酒店', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 3 ,point:4},
				{ScenicId:3,name: '杭州马可波罗酒店', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 3 ,point:3.5},
				{ScenicId:4,name: '四季酒店', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', flex: 3 ,point:3},
				]
			}},
			watch: {
				loader () {
					const l = this.loader
					this[l] = !this[l]
			
					setTimeout(() => (this[l] = false), 2000)
			
					this.loader = null
				},
				},
				methods:{
					gohotelinfo(){
						this.$router.push({path:'/mainpage/showhotel/hotelinfo',query:{hotelname:'四季酒店',hotelID:'S001',hotelstarlevel:'五星'}})
					}
				}
			
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