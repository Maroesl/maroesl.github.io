import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import AVPlugin from 'vue-audio-visual';

Vue.config.productionTip = false

Vue.filter("time2mmss", function (value) {
  if (!value) return "";

  return `${String(Math.floor(value / 60)).padStart(2, "0")}:${String((value % 60).toFixed(0)).padStart(2, "0")}`;
}); 

Vue.use(AVPlugin);


new Vue({
  router,
  
  render: h => h(App)
}).$mount('#app')
