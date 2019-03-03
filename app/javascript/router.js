import VueRouter from 'vue-router'

import Game from 'components/game'
import Menu from 'components/menu'

const routes = [
  { path: '/levels/:levelNumber', component: Game },
  { path: '/', component: Menu }
]

export const router = new VueRouter({
  routes
})
