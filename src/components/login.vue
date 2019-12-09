	<template>
		<v-card>
		<v-app-bar color="#375D9B" height="200">
		<v-toolbar-title >全域旅游营销服务平台企业端</v-toolbar-title>
		
		</v-app-bar>
		
		<v-container>
			<v-row>
				<v-col cols="6">
					<v-card height="500"></v-card>
				</v-col>
				<v-col cols="6">
					<v-card
						class="mx-auto"
						style="max-width: 500px;"
					>
						<v-toolbar
						color="primary"
						cards
						dark
						flat
						>
						<v-card-title class="title font-weight-regular">登录</v-card-title>
						<v-spacer></v-spacer>
						</v-toolbar>
						<v-form
						ref="form"
						v-model="form"
						class="pa-4 pt-6"
						>
						<v-text-field
							
							filled
							color="cyan"
							:rules="[rules.required]"
							label="用户名"
							style="min-height: 96px"
							ref="username"
							v-model="username"
						></v-text-field>
						<br />
						<v-text-field
							v-model="password"
							filled
							:append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
							:rules="[rules.required, rules.length(6)]"
							:type="show1 ? 'text' : 'password'"
							name="input-10-1"
							label="密码"
							ref="password"
							hint="At least 6 characters"
							counter
							@click:append="show1 = !show1"
						></v-text-field>
						</v-form>
						<v-divider></v-divider>
						<v-card-actions>
						<v-btn
						color="cyan"
						@click="$refs.form.reset()"
						ma="2"
						>
							清空
						</v-btn>
						<v-spacer></v-spacer>
						<v-btn @click="register()" color="cyan" ma="2">
							注册
						</v-btn>
						<v-btn
							class="white--text"
							color="cyan"
							ma="2"
							depressed
							@click="go()"
						>登录</v-btn>
						</v-card-actions>
						
					</v-card>
				</v-col>
			</v-row>
		</v-container>
		</v-card>
	</template>

	<script>
		export default {
			data: () => ({
			show1: false,
			form:false,
			isLoading: false,
			username: undefined,
			password: undefined,
			rules: {
				email: v => (v || '').match(/@/) || 'Please enter a valid email',
				length: len => v => (v || '').length >= len || `Invalid character length, required ${len}`,
				password: v => (v || '').match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/) ||
				'Password must contain an upper case letter, a numeric character, and a special character',
				required: v => !!v || 'This field is required',
			},
			}),
			methods:{
				register(){
					this.$router.push({path:'/register'})
				},
				go(){
					var _this=this;
					var username = this.username.trim();
					var password = this.password.trim();
					alert(username);
					this.axios.defaults.baseURL = '';
					// this.$router.push('/mainpage')
					this.axios({
						method:'get',
						url:'http://192.168.1.192:8080/Administration/login.do',
						params:{username:username,password:password},
						contentType: "application/json;charset=UTF-8",
						dataType:"json",
					}).then((response) =>{
						//如果登录成功
						
						if(response.data.status==0){
							_this.$router.push('/mainpage');
						}
						alert(response.data.msg);
					})
					.catch((error) =>{
						alert(error);
					})

				}
				
			}
		}
	</script>

	<style scoped>
	</style>
