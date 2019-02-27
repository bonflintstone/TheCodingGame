import Vue from 'vue'
import Vuetify from 'vuetify'
import VueRouter from 'vue-router'
import App from '../app.vue'

import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

import { router } from '../router'

Vue.use(Vuetify)
Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('game'))
  const app = new Vue({
    router,
    el,
    render: h => h(App)
  })
})
