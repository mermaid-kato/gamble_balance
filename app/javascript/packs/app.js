import Vue from 'vue/dist/vue.esm.js'
import App from '../components/app.vue'
import Draggable from 'vuedraggable'

new Vue({
  el: 'app',
  components: {
    draggable: Draggable
  }
})
