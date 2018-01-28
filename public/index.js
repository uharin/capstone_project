/* global Vue, VueRouter, axios, google */

// ===================================
// HOMEPAGE
// ===================================

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: 
        "Welcome to Wurld!"
    };
  }
};

// ===================================
// DASHBOARD
// ===================================

var Dashboard = {
  template: "#dashboard",
  data: function() {
    return {
      message: "This is the dashboard!",
      places: [],
      name: "",
      formatted_address: "",
      icon: "",
      userMap: null
    };
  }

  // created: function() {
  // // THIS CODE WORKS TO GRAB DATA FROM GMAPS
  //   axios.get('/places').then(function(response) {
  //     console.log(response.data);
  //     this.places = response.data;
  //   }.bind(this));
  // }
};

// ===================================
// LOCATIONS
// ===================================

var Locations = {
  template: "#locations",
  data: function() {
    return {
      locations: [],
      isDefault: true
    };
  },
  created: function() {
    axios.get('/locations').then(function(response) {
      console.log(response.data);
      this.locations = response.data;
    }.bind(this));
  },
  methods: {
    deleteLocation: function(inputLocation) {
      var params = {
        location_id: inputLocation.id
      };
      axios.delete('/locations/' + inputLocation.id).then(function(response) {
        this.locations.splice(this.locations.indexOf(inputLocation), 1);
        router.push('/locations');
      }.bind(this));
    },
    editLocation: function(inputLocation) {
      var params = {
        location_id: inputLocation.id
      };
      router.push("/locations/" + inputLocation.id + "/edit");
    },
    setDefault: function(inputLocation) {
      var params = {
        location_id: inputLocation.id
      };
      axios.patch("/locations/" + inputLocation.id).then(function(response) {
        router.push('dashboard');
      }.bind(this));
    }
  },
};

// ===================================
// ADD LOCATION
// ===================================

var NewLocation = {
  template: "#new-location",
  data: function() {
    return {
      location: {
        defaultLocation: false
      }
    };
  },
  methods: {
    createLocation: function() {
      var params = {
        street_address: this.location.streetAddress,
        city: this.location.city,
        state: this.location.state,
        zip: this.location.zip,
        is_default: this.location.defaultLocation
      };
      axios.post("/locations", params).then(function(response) {
        router.push("/locations");
      }.bind(this));
    }
  }
};

// ===================================
// UPDATE LOCATION
// ===================================

var UpdateLocation = {
  template: "#update-location",
  data: function() {
    return {
      location: {

      }
    };
  },
  created: function() {
    axios.get("/locations/" + this.$route.params.id + "edit").then(function(response) {
      // this.location = response.body;

    // +++++++++++++++++++++++++++++++++++
    // THIS IS BROKEN
    // +++++++++++++++++++++++++++++++++++
    
      console.log(response.body);
      console.log(this.$route.params.id);
    }.bind(this));
  },
  methods: {
    updateLocation: function() {
      var params = {
        street_address: this.location.streetAddress,
        city: this.location.city,
        state: this.location.state,
        zip: this.location.zip
      };
      axios.patch("/locations/" + this.$route.params.id, params).then(function(response) {
        router.push("/locations");
      }.bind(this));
    }
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
          router.push("/dashboard");
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
    { path: "/useractions", component: UserActions },
    { path: "/signup", component: SignUp },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    { path: "/dashboard", component: Dashboard },
    { path: "/locations", component: Locations},
    { path: "/locations/:id/edit", component: UpdateLocation},
    { path: "/locations/new", component: NewLocation}
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