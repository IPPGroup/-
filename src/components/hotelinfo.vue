<template>
	<v-list>
		<v-list-item v-for="(detail,i) in details"  :key="i">
			<v-list-tile-content>
				<v-text-field v-text="detail[0]">
				</v-text-field>
			</v-list-tile-content>
		</v-list-item>
	</v-list>
</template>

<script>
	export default{
		data(){
			return {
				items:[
					{id:'11111'}
				]
			}
		},
		created:function(){
			this.getQuerys();
		},
		watch:{
			'$router':'getQuery'
		},
		methods:{
			getQuerys:function(){
				var details = this.$route.query
				this.textareText = details
			}
		}
	}
</script>

<style>
</style>
