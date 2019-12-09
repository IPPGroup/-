import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify';
import 'roboto-fontface/css/roboto/roboto-fontface.css'
import '@fortawesome/fontawesome-free/css/all.css'
import '@mdi/font/css/materialdesignicons.css'
import Vuetify from 'vuetify/lib'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import VueAxios from 'vue-axios'



Vue.use(Vuetify);
Vue.use(ElementUI);
Vue.use(VueAxios, axios);
Vue.config.productionTip = false

Vue.prototype.httpURL = 'http://192.168.1.192:8080'

new Vue({
  vuetify,
  router,
  render: h => h(App)
}).$mount('#app')
export default new Vuetify({
  icons: {
    iconfont: 'mdi', // 'mdi' || 'mdiSvg' || 'md' || 'fa' || 'fa4'
  },
})
