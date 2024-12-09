import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeRecommendedView from '../views/HomeRecommendedView.vue'
import HomeHotView from '../views/HomeHotView.vue'
import HomeSearchView from '../views/HomeSearchView.vue'
import DetailsMusic from '@/views/DetailsMusic.vue'
import SongPage from '@/views/SongPage.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeRecommendedView,
    meta: { showNav: true },
  },
  {
    path: '/hot',
    name: 'hot',
    component: HomeHotView,
    meta: { showNav: true },
  },
  {
    path: '/search',
    name: 'search',
    component: HomeSearchView,
    meta: { showNav: true },
  },
   {
    path: '/details',
    name: 'details',
    component: DetailsMusic
  },
  {
    path: '/songpage',
    name: 'songpage',
    component: SongPage,
    meta: { hidePlaybar: true },
  },


]

const router = new VueRouter({
  routes
})

export default router
