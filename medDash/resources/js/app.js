/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
require('admin-lte');
import Vue from 'vue'
window.Vue = require('vue');

//passport
Vue.component(
  'passport-clients',
  require('./components/passport/Clients.vue').default
);

Vue.component(
  'passport-authorized-clients',
  require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
  'passport-personal-access-tokens',
  require('./components/passport/PersonalAccessTokens.vue').default
);



//VFORM
import {Form,HasError,AlertError} from 'vform'
window.Form=Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)


import VueRouter from 'vue-router'
Vue.use(VueRouter)
let routes = [
    { path: '/dashboard', component: require('./components/Dashboard.vue').default },
    { path: '/profile', component: require('./components/Profile.vue').default },
    { path: '/user', component: require('./components/Users.vue').default },
    { path: '/sales', component: require('./components/Sales.vue').default },
    { path: '*', component: require('./components/NotFound.vue').default }  
  ]

  const router = new VueRouter({
    mode:'history',
    routes 
    })

    
  
  //Filters
    Vue.filter('textMaj' ,function(text){
      return text.toUpperCase();

    });

//moment Filter
import moment from 'moment'
Vue.filter('timeFilter',function(created){
  return moment(created).format('MMMM Do YYYY');
});



//Sweet Alert
import Swal from 'sweetalert2'
window.Swal = Swal;

const toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 2000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

window.toast = toast; //to use it where ever we want on our app



//Progress Bar
import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
  color: 'green',
  failedColor: 'red',
  height: '5px'
})

//fire

window.Fire =new Vue();

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

const app = new Vue({
  el: '#app',
  router,
  //search
  data:{
    search:''
  },
  methods:{
    searchit: _.debounce(() => {
        Fire.$emit('searching');
    },1000),

    printme() {
        window.print();
    }
}
});

Vue.component('example-component', require('./components/ExampleComponent.vue').default);



/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

