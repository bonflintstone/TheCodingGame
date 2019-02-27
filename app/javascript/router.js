import VueRouter from 'vue-router'

import Game from 'components/game'

const routes = [{ path: '/:levelNumber', component: Game }]

export const router = new VueRouter({
  routes
})
