/* global Vue, VueRouter, axios, google */

// ===================================
// HOMEPAGE
// ===================================

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: 
        "Welcome to Wurld!",
    };
  },
};

// ===================================
// SIGNUP
// ===================================

var SignUp = {
  template: "#signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      zip: "",
      errors: []
    };
  },
  methods: {
    signup: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios.post("/users", params).then(function(response) {
        router.push("/login");
      })
        .catch(function(error) {
          this.errors = error.response.data.errors;
        }.bind(this)
        );
    }
  },
};

// ===================================
// LOGIN
// ===================================

var Login = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    login: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] = "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("index.html/dashboard");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );

    }
  },
};

// ===================================
// LOGOUT
// ===================================

var Logout = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

// ===================================
// ROUTER
// ===================================

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignUp },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});


// ===================================
// VUE OBJECT
// ===================================


var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});