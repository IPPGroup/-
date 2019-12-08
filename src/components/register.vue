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
						<v-card-title class="title font-weight-regular">注册</v-card-title>
						<v-spacer></v-spacer>
						<v-btn @click="back()">返回</v-btn>
						</v-toolbar>
						<v-form
						ref="form"
						v-model="form"
						class="pa-4 pt-6"
						>
						<v-text-field
							
							filled
							color="cyan"
		
							label="userId"
							style="min-height: 96px"
							clearable
						></v-text-field>
						<br />
						<v-text-field
							v-model="password"
							:rules="[rules.password, rules.length(11)]"
							filled
							clearable
							color="deep-purple"
							counter="11"
							label="Password"
							style="min-height: 96px"
							type="password"
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
						<v-btn
							:disabled="!form"
							:loading="isLoading"
							class="white--text"
							color="cyan"
							depressed
							@click="register()"
							>注册</v-btn>
						
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
			form: false,
			isLoading: false,
			password: undefined,
			rules: {
				email: v => (v || '').match(/@/) || 'Please enter a valid email',
				length: len => v => (v || '').length >= len || `Invalid character length, required ${len}`,
				password: v => (v || '').match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/) ||
				'密码必须至少包含一个大写字母,小写字母,和一个特殊字符',
				required: v => !!v || 'This field is required',
			},
			}),
			methods:{
				register(){
					alert("注册成功")
				},
				back(){
					this.$router.push("/")
				}
			}
		}
	</script>

	<style>
	</style>
