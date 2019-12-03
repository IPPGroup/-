<template>
	
	<v-app>
		<appBar></appBar>
		<v-row>
			<v-col cols="4">
				<Drawer></Drawer>
			</v-col >
				
			<v-col cols="8">
				<Addproject></Addproject>
			</v-col>
		</v-row>
		
			
		
		
			
		
		
	</v-app>
</template>

<script>
import appBar from './components/appbar'
import Drawer from './components/drawer'
import Addproject from './components/addProject'

export default {
  name: 'App',

  components: {
	appBar,Drawer,Addproject
  },

  data: () => ({
    //
  }),
};
</script>
<style>
	
</style>