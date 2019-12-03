import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify';
import 'roboto-fontface/css/roboto/roboto-fontface.css'
import '@fortawesome/fontawesome-free/css/all.css'
import '@mdi/font/css/materialdesignicons.css'
import Vuetify from 'vuetify/lib'
import Router from 'vue-router'

Vue.use(Router)
Vue.use(Vuetify)
Vue.config.productionTip = false

new Vue({
  vuetify,
  Router,
  render: h => h(App)
}).$mount('#app')
export default new Vuetify({
  icons: {
    iconfont: 'mdi', // 'mdi' || 'mdiSvg' || 'md' || 'fa' || 'fa4'
  },
})