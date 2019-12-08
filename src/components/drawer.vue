		<template>
			<v-row>
				<v-col cols="3">
					<v-card width="300">
			<v-navigation-drawer  color="#6089c1" dark permanent height="800" width="100%">
			<v-list>
				<v-list-item>
					<v-list-item-icon>
						<v-icon>mdi-home</v-icon>
					</v-list-item-icon>
			
					<v-list-item-title>功能列表</v-list-item-title>
				</v-list-item>
				<v-list-group
					prepend-icon="mdi-file-document-box-plus-outline"
					active-class="border"
					color=white
				>
					<template v-slot:activator>
						<v-list-item-title>添加产品</v-list-item-title>
					</template>
			
						<router-link 
						v-for="(add, i) in adds"
						:key="i"
						:to="add[2]">
						<v-list-item link active-class="border">
							<v-list-item-title v-text="add[0]"></v-list-item-title>
						<v-spacer></v-spacer>
							<v-list-item-icon>
								<v-icon v-text="add[1]"></v-icon>
							</v-list-item-icon>
							<v-divider></v-divider>
						
						</v-list-item>
						</router-link>
					</v-list-group>
					
					
					
					<v-list-group
						prepend-icon="mdi-clipboard-text-outline"
						color=#EFEFED
						active-class="border"
					>
						<template v-slot:activator>
							<v-list-item-title>产品信息管理</v-list-item-title>
						</template>
						
						
						<router-link
						v-for="(good, i) in goods"
						:key="i"
						:to="good[2]">
							<v-list-item
								
								link
							>
								<v-list-item-title v-text="good[0]"></v-list-item-title>
								<v-list-item-icon>
									<v-icon v-text="good[1]"></v-icon>
								</v-list-item-icon>
							</v-list-item>
						</router-link>
						</v-list-group>
						
						
						
						<v-list-group
							prepend-icon="mdi-file-document-edit-outline"
							color=#EFEFED
							active-class="border"
						>
							<template v-slot:activator>
								<v-list-item-title>订单管理</v-list-item-title>
							</template>
							
							
							<router-link
							v-for="(order, i) in orders"
							:key="i"
							:to="order[2]">
								<v-list-item link >
									<v-list-item-title v-text="order[0]"></v-list-item-title>
									<v-list-item-icon>
										<v-icon v-text="order[1]"></v-icon>
									</v-list-item-icon>
								</v-list-item>
							</router-link>
							</v-list-group>
							
							
							
							<v-list-group
								prepend-icon="mdi-account-multiple-plus-outline"
								color=#EFEFED
								active-class="border"
							>
								<template v-slot:activator>
									<v-list-item-title>账号管理</v-list-item-title>
								</template>
								
								<router-link
								v-for="(account, i) in accounts"
								:key="i"
								:to="account[2]">
									<v-list-item
										link
										
									>
										<v-list-item-title v-text="account[0]"></v-list-item-title>
										<v-list-item-icon>
											<v-icon v-text="account[1]"></v-icon>
										</v-list-item-icon>
									</v-list-item>
									</router-link>
									</v-list-group>
								
					</v-list>
			</v-navigation-drawer>
			</v-card>
			</v-col>
			<v-col cols="9">
				<v-card width="100%" height="50px" color="#646C7F">
				<div class="navbar">
						<el-breadcrumb class="breadcrumb-container" separator="/">
							<el-breadcrumb-item v-for="item in levelList"  :key="item.path" :to="item.path">
							{{item.meta.title}}
							</el-breadcrumb-item>
						</el-breadcrumb>
					</div>
				</v-card>
				<router-view></router-view>	
			</v-col>
		</v-row>
		</template>
		<script>
		export default {
			name: 'Navbar',
			data() {
				return {
					levelList: [],
						adds: [
							['添加酒店', 'mdi-domain-plus','/mainpage/addhotel'],
							['添加门票', 'mdi-receipt','/mainpage/addspot'],
						],
							goods:[
								['酒店信息管理','mdi-bank-plus','/mainpage/showhotel'],
								['景点信息管理','mdi-led-strip','/mainpage/showspot'],
						],
							orders:[
								['酒店订单','mdi-domain-plus','/mainpage/hotelorder'],
								['门票订单','mdi-receipt','/mainpage/ticketorder'],
								['订单核销','mdi-file-document-box-remove-outline','/mainpage/deleteorder'],
							],
							accounts:[
								['账号信息','mdi-account-key-outline','/mainpage/showaccount'],
								['添加账号','mdi-account-plus-outline','/mainpage/addaccount']
								
							],
					
				}},
				watch: {
					$route() {
						this.getBreadcrumb()
					}
				},
				created(){
					this.getBreadcrumb()
				},
				methods:{
					getBreadcrumb() {
						let matched = this.$route.matched.filter(item => item.name)
						const first = matched[0];
						if (first && first.name.trim().toLocaleLowerCase() !== '/'.toLocaleLowerCase()) {
							matched = [{ path: '/', meta: { title: '首页' }}].concat(matched)
							}
						this.levelList = matched
					}
				}
			}
			
	</script>
		<style >
			.border{
				border: 5px white;
			}
			.navbar {
				padding-top: 20px !important;
				padding-left: 20px !important; 
				
			}
			.el-breadcrumb {
				font-size: 20px !important;
				color: white !important; 
			}
			.el-breadcrumb__inner.is-link{
				color: white !important; 
			}
			.el-breadcrumb__inner{
				color: white !important; 
			}
		</style>