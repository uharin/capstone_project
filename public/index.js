/* global Vue, VueRouter, axios */

// ===================================
// HOMEPAGE
// ===================================

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      users: [],
      places: [],
      first_name: "",
      last_name: "",
      points: "",
      username: "",
      // name: "",
      // address: "",
      // icon: ""
    };
  },

  created: function() {
  
  // THIS CODE WORKS TO GRAB DATA FROM USERS

    axios.get('/users').then(function(response) {
      console.log(response.data);
      this.users = response.data;
    }.bind(this));
    
  // THIS CODE WORKS TO GRAB DATA FROM GMAPS
  
  //   axios.get('/places').then(function(response) {
  //     console.log(response.data);
  //     this.places = response.data;
  //   }.bind(this));
  },

  methods: {

  },

  computed: {

  }
};

// ===================================
// PLACES
// ===================================

var Places = {
  template: "#places",
  data: function() {
    return {
      places: [],
      name: "",
      formatted_address: "",
      icon: ""
    };
  },

  created: function() {
    
  // THIS CODE WORKS TO GRAB DATA FROM GMAPS
  
    axios.get('/places').then(function(response) {
      console.log(response.data);
      this.places = response.data;
    }.bind(this));
  },

  methods: {

  },

  computed: {

  }
};

// ===================================
// USERACTIONS
// ===================================

var UserActions = {
  template: "#useractions",
  data: function() {
    return {
      
    };
  },

  created: function() {
    
  // THIS CODE WORKS TO GRAB DATA FROM GMAPS
  
    axios.get('/places').then(function(response) {
      console.log(response.data);
      this.places = response.data;
    }.bind(this));
  },

  methods: {

  },

  computed: {

  }
};

// ===================================
// ROUTER
// ===================================

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/places", component: Places },
    { path: "/useractions", component: UserActions }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});