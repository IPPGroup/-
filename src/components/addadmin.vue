<template>
	<v-card>
		<v-card-title>添加管理员<v-btn color="primary" @click.stop="add = true">添加</v-btn></v-card-title>
		
		
		<v-dialog
			v-model="add"
			max-width="290"
			>
			<v-card>
				<v-list-item  three-line>
				<v-lisi-item-content>
				<v-list-item-title class="headline mb-1">新增管理员</v-list-item-title>
				<br />
				<v-list-item-title class="mb-1">名称</v-list-item-title>
				<v-text-field 
				v-model="username"
				:rules="[rules.required]"
				
				>
				</v-text-field>
				<v-list-item-title>密码</v-list-item-title>
				<v-text-field v-model="password" :rules="[rules.required,rules.password]">
				</v-text-field>
				<v-list-item-title>确认密码</v-list-item-title>
				<v-text-field v-model="password1" :rules="[rules.required]">
				</v-text-field>
				<v-list-item-title>真实姓名</v-list-item-title>
				<v-text-field v-model="myname" :rules="[rules.required]">
				</v-text-field>
				</v-lisi-item-content>
				</v-list-item>
				<v-card-actions>
					
				<v-spacer></v-spacer>
		
				<v-btn
					color="primary"
					@click="add = false"
				>
					取消
				</v-btn>
		
				<v-btn
					color="error"
					@click="check()"
				>
					添加
				</v-btn>
				</v-card-actions>
			</v-card>
			</v-dialog>
	</v-card>
</template>

<script>
	export default{
		data(){
			return{
				add:false,
				username: undefined,
				password: undefined,
				password1: undefined,
				myname: undefined,
				rules:{
					email: v => (v || '').match(/@/) || 'Please enter a valid email',
					length: len => v => (v || '').length >= len || `Invalid character length, required ${len}`,
					password: v => (v || '').match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/) ||
					'Password must contain an upper case letter, a numeric character, and a special character',
					required: v => !!v || '必须写',
				}
			}
		},
		methods:{
			check(){
				this.add=false;
				var username = this.username.trim();
				var password = this.password.trim();
				var myname = this.myname.trim();
				this.axios.defaults.baseURL = '';
				if(this.password == this.password1)
				{
					this.axios({
						method:'get',
						url:'http://192.168.1.192:8080/Administration/register.do',
						params:{username:username,password:password,myname:myname},
						contentType: "application/json;charset=UTF-8",
						dataType:"json",
					}).then((response) =>{
						//如果登录成功
						
						if(response.data.status==0){
							alert('添加成功')
						}
						alert(response.data.msg);
					})
					.catch((error) =>{
						alert(error);
					})
				}
			}
		}
		
	}
</script>

<style>
	.v-btn{
		margin-left: 10px;
	}
</style>
