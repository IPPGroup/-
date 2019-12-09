<template>
	<v-card >
	<v-card-title>
		管理员编号:{{id}}
	</v-card-title>
	<br />
	<v-card-title>
		花名:{{name}}
		<v-btn @click.stop="modify = true" color="primary">修改</v-btn>
	</v-card-title>
	
	<br />
	<v-card-title>
		密码:{{mima}}
		<v-btn @click.stop="modify = true" color="primary">修改</v-btn>
	</v-card-title>
	
	<v-dialog
		v-model="modify"
		max-width="290"
		>
		<v-card>
			<v-card-title class="modify">请修改</v-card-title>
			
			<v-form
			ref="form"
			v-model="form"
			class="pa-4 pt-6"
			>
			<v-text-field
				
				filled
				color="cyan"
				style="min-height: 96px"
				clearable
			></v-text-field>
			<br />
			
			</v-form>
			
			<v-card-actions>
			<v-spacer></v-spacer>
	
			<v-btn
				color="primary"
				@click="modify = false"
			>
				修改
			</v-btn>
	
			<v-btn
				color="error"
				@click="modify = false"
			>
				不修改
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
				id:'001',
				name:'嵊县姚少',
				mima:'123456789',
				modify:false,
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
			}
		}
	}
</script>

<style>
</style>
