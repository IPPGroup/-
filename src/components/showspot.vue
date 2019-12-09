<template>
  <v-card
    class="mx-auto"
    width="100%"
	color="#EFEFED"
  >
    <v-container fluid v-show="flag">
		<v-col cols="12" sm="12">
			<v-autocomplete  :items="components" label="search" outlined clearable></v-autocomplete>
				<v-btn  class="ma-2"  color="blue darken-2"   large :loading="loading"  :disabled="loading" @click="loader = 'loading'">
					<v-icon dark left>
						mdi-magnify
					</v-icon>搜索
				</v-btn>
		</v-col>
      <v-row dense>
        <v-col
          v-for="card in cards"
          :key="card.title"
          :cols="4"
        >
          <v-card>
            <v-img
              :src="card.src"
              class="white--text align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="200px"
            >
				
				<v-card-title v-text="card.ScenicName"></v-card-title>
            </v-img>
			<v-card-actions>
				<v-btn color="primary" @click="gospotinfo()">详细信息</v-btn>
				<v-spacer></v-spacer>
				<v-btn color="error" @click.stop="confirm = true">下架信息</v-btn>
			</v-card-actions>
          </v-card>
        </v-col>
		
		
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
      </v-row>
    </v-container>
	<router-view v-show="flag1"></router-view>
  </v-card>
</template>


<script>
  export default {
    data () {
		return{
		loader: null,
		loading: false,
		flag:true,
		flag1:false,
		confirm: false,
		components: [
			'西湖', '飞来峰', '千岛湖', '宋城', '西溪国家湿地公园', '灵隐寺', '杭州野生动物世界', '景区4', '景区5', '景区6',
			],
      cards: [
			{ScenicId: 1,ScenicName: '西湖', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg',ScenicPoint:4.5},
			{ScenicId: 2,ScenicName: '飞来峰', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg',ScenicPoint:4},
			{ScenicId: 3,ScenicName: '千岛湖', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg',ScenicPoint:3.5},
			{ScenicId: 4,ScenicName: '宋城', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg',ScenicPoint:3},
		],
		}},
		watch: {
			loader () {
				const l = this.loader
				this[l] = !this[l]
		
				setTimeout(() => (this[l] = false), 2000)
		
				this.loader = null
			},
			$route(from){
				if(from.path=='/mainpage/showspot'){
					this.flag=true;
					
					}
				if(from.path=='/mainpage/showspot/spotinfo'){
					this.flag1=true;
					
					}
				},
			},
		methods:{
			gospotinfo(){
				this.flag = !this.flag
				this.flag1 = !this.flag1
				this.$router.push({path:'/mainpage/showspot/spotinfo',query:{hotelname:'西湖',hotelID:'S002',hotelstarlevel:'五星'}})
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
