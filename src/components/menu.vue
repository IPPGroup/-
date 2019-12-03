<template>
	<div class="text-center">
		<v-menu offset-y pt:12>
			<template v-slot:activator="{ on }">
				<v-btn
				color="primary"
				dark
				v-on="on"
			>
				Dropdown
			</v-btn>
			</template>
			<v-list>
				<v-list-item
				v-for="(item, index) in items"
				:key="index"
				@click="items"
			>
				<v-list-item-title>{{ item.title }}</v-list-item-title>
			</v-list-item>
			</v-list>
		</v-menu>
		<v-menu offset-y>
			<template v-slot:activator="{ on }">
				<v-btn
				color="primary"
				dark
				v-on="on"
			>
				Dropdown
			</v-btn>
			</template>
			<v-list>
				<v-list-item
				v-for="(item, index) in items"
				:key="index"
				@click="items"
			>
				<v-list-item-title>{{ item.title }}</v-list-item-title>
			</v-list-item>
			</v-list>
		</v-menu>
		<v-menu offset-y>
			<template v-slot:activator="{ on }">
				<v-btn
				color="primary"
				dark
				v-on="on"
			>
				Dropdown
			</v-btn>
			</template>
			<v-list>
				<v-list-item
				v-for="(item, index) in items"
				:key="index"
				@click="items"
			>
				<v-list-item-title>{{ item.title }}</v-list-item-title>
			</v-list-item>
			</v-list>
		</v-menu>
		<div style="height: 500px;"></div>
	</div>
</template>

<script>
	export default {
		data: () => ({
			items: [
			{ title: 'Click Me' },
			{ title: 'Click Me' },
			{ title: 'Click Me' },
			{ title: 'Click Me 2' },
			],
		}),
		}
</script>

<style>
	
</style>
