<template>
  
    <v-navigation-drawer
      class="accent-4"
		color="#375D9B"
      dark
      permanent
		height="800"
    >
	<v-list>
		<v-list-item>
			<v-list-item-icon>
				<v-icon>mdi-home</v-icon>
			</v-list-item-icon>
	
			<v-list-item-title>功能列表</v-list-item-title>
		</v-list-item>
		<v-list-group
			prepend-icon="mdi-file-document-box-plus-outline"
		
		>
			<template v-slot:activator>
				<v-list-item-title>添加产品</v-list-item-title>
			</template>
	
			
				<v-list-item
					v-for="(add, i) in adds"
					:key="i"
					link
				>
					<v-list-item-title v-text="add[0]"></v-list-item-title>
					<v-list-item-icon>
						<v-icon v-text="add[1]"></v-icon>
					</v-list-item-icon>
				</v-list-item>
			</v-list-group>
			
			
			
			<v-list-group
				prepend-icon="mdi-clipboard-text-outline"
			>
				<template v-slot:activator>
					<v-list-item-title>产品信息管理</v-list-item-title>
				</template>
				
				
				
					<v-list-item
						v-for="(good, i) in goods"
						:key="i"
						link
					>
						<v-list-item-title v-text="good[0]"></v-list-item-title>
						<v-list-item-icon>
							<v-icon v-text="good[1]"></v-icon>
						</v-list-item-icon>
					</v-list-item>
				</v-list-group>
				
				
				
				<v-list-group
					prepend-icon="mdi-file-document-edit-outline"
				>
					<template v-slot:activator>
						<v-list-item-title>订单管理</v-list-item-title>
					</template>
					
					
					
						<v-list-item
							v-for="(order, i) in orders"
							:key="i"
							link
						>
							<v-list-item-title v-text="order[0]"></v-list-item-title>
							<v-list-item-icon>
								<v-icon v-text="order[1]"></v-icon>
							</v-list-item-icon>
						</v-list-item>
					</v-list-group>
					
					
					
					<v-list-group
						prepend-icon="mdi-account-multiple-plus-outline"
					>
						<template v-slot:activator>
							<v-list-item-title>账号管理</v-list-item-title>
						</template>
						
						
							<v-list-item
								v-for="(account, i) in accounts"
								:key="i"
								link
							>
								<v-list-item-title v-text="account[0]"></v-list-item-title>
								<v-list-item-icon>
									<v-icon v-text="account[1]"></v-icon>
								</v-list-item-icon>
							</v-list-item>
							</v-list-group>
						
			</v-list>
	

      <template v-slot:append>
        <div class="pa-2">
          <v-btn block>注销</v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  
</template>
<script>
  export default {
    data: () => ({
      adds: [
        ['添加酒店', 'mdi-domain-plus'],
        ['添加门票', 'mdi-receipt'],
      ],
		goods:[
			['酒店信息管理','mdi-bank-plus'],
			['门票信息管理','mdi-led-strip'],
	],
		orders:[
			['酒店订单','mdi-domain-plus'],
			['门票订单','mdi-receipt'],
			['订单核销','mdi-file-document-box-remove-outline'],
		],
		accounts:[
			['账号信息','mdi-account-key-outline'],
			['添加账号','mdi-account-plus-outline']
			
		],
      cruds: [
        ['Create', 'add'],
        ['Read', 'insert_drive_file'],
        ['Update', 'update'],
        ['Delete', 'delete'],
      ],
    }),
  }
</script>