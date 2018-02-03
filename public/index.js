/* global Vue, VueRouter, axios, google $ Highcharts */

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
      message: "Welcome to WURLD!",
      places: [],
      user: {
        name: "",
        points: "",
        local_users: [],
        city: "",
        state: ""
      },
      userMap: null
    };
  },

  mounted: function() {

    axios.get('/users/:id').then(function(response) {
      this.user = response.data;
      var loggedUser = this. user;
      var localUsers = this.user.local_users;
      console.log("Local users are");
      console.log(localUsers);
      
      // maybe come back to this to reduce code 
      // var mappedPoints = [];
      // for (var i = 0; i < 10; i++) {
      //   mappedPoints.push([localUsers[i].name][localUsers[i].points]);
      // }

      var myChart = Highcharts.chart('map-container', {
        chart: {
          type: 'column'
        },
        title: {
          text: 'Leaderboard'
        },
        xAxis: {
          categories: ['Users']
        },
        yAxis: {
          title: {
            text: 'Points'
          }
        },
        plotOptions: {
          column: {
            pointPadding: 0,
            borderWidth: 8,
            groupPadding: 0,
            shadow: true
          }
        },   
        series: [{
        
        // maybe come back to this to reduce code 
        // name: "Local Users",
        // data: mappedPoints

          name: localUsers[0].name,
          data: [localUsers[0].points]
        },
        {  
          name: localUsers[1].name,
          data: [localUsers[1].points]
        },
        {  
          name: localUsers[2].name,
          data: [localUsers[2].points]
        }, 
        {  
          name: localUsers[3].name,
          data: [localUsers[3].points]
        }, 
        {  
          name: localUsers[4].name,
          data: [localUsers[4].points]
        }, 
        {  
          name: localUsers[5].name,
          data: [localUsers[5].points]
        },  
        {  
          name: localUsers[6].name,
          data: [localUsers[6].points]
        }, 
        {  
          name: localUsers[7].name,
          data: [localUsers[7].points]
        },
        {  
          name: localUsers[8].name,
          data: [localUsers[8].points]
        },
        {  
          name: localUsers[9].name,
          data: [localUsers[9].points]
        }],    
      });

      // MAPS
      // ============================================

      axios.get('/places').then(function(response) {
        this.places = response.data;
        var recylingPlaces = this.places;
        console.log(this.places);
      

        var initMap = function(user, places) {
          console.log("Init map function");
          // console.log(this.user.latitude);
          var userLocation = {lat: user.latitude, lng: user.longitude};
          var map = new google.maps.Map(document.getElementById('userMap'), {
            zoom: 11,
            center: userLocation
          });

          var gmarkers = [];

          for (var i = 0; i < places.length; i++) {
            var location = places[i].geometry.location;
            var position = new google.maps.LatLng(location.lat, location.long);
            var marker = new google.maps.Marker({
              position: position,
              map: map,
              title: places[i].name 
            });
            gmarkers.push(marker);
          }
        };
        // Use JQuery to wait until document loads, then run initMap()
        // ==============================
        $(document).ready(function() {
          initMap(loggedUser, recylingPlaces);
          console.log("ready!");
        });
      }.bind(this));
    });
  },
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
      userActions: []
    };
  },

  created: function() {
  
    axios.get('/user_actions').then(function(response) {
      console.log(response.data);
      this.userActions = response.data;
    }.bind(this));
  },

  methods: {
  },

  computed: {

  }
};

// ===================================
// ADD USERACTION
// ===================================

var NewUserAction = {
  template: "#new-useraction",
  data: function() {
    return {
      actionOption: true,
      amount: "",
    };
  },
  methods: {
    createUserAction: function() {
      var params = {
        action_id: this.actionOption,
        amount: this.amount
      };
      axios.post("/user_actions", params).then(function(response) {
        router.push("/useractions");
      }.bind(this));
    }
  }
};

// ===================================
// MESSAGE BOARD
// ===================================

var MessageBoard = {
  template: "#message-board",
  data: function() {
    return {
      boardThreads: [],
      showNewThread: false,
      thread: {},
      sortAttribute: "created_at",
      sortDesc: true,
      current_user: ""
    };
  },

  created: function() {
  
    axios.get('/threads').then(function(response) {
      console.log(response.data);
      this.boardThreads = response.data;
      this.boardThreads.reverse();
    }.bind(this));

    axios.get('/users/:id').then(function(response) {
      console.log(response.data);
      this.current_user = response.data;
    }.bind(this));
  },

  methods: {
    readMore: function(inputBoardThread) {
      var params = {
        board_thread_id: inputBoardThread.id
      };
      router.push('/messageboard/' + inputBoardThread.id);
    },

    createThread: function() {
      var params = {
        title: this.thread.title,
        post_text: this.thread.postText
      };
      axios.post("/threads", params).then(function(response) {
        this.boardThreads.push(this.thread);
        // router.push("/messageboard");
      }.bind(this));
      axios.get('/threads').then(function(response) {
        console.log(response.data);
        this.boardThreads = response.data;
        this.boardThreads.reverse();
        this.showNewThread = false;
      }.bind(this)); 
    },

    deleteThread: function(inputThread) {
      var params = {
        thread_id: inputThread.id
      };
      axios.delete('/threads/' + inputThread.id).then(function(response) {
        this.boardThreads.splice(this.boardThreads.indexOf(inputThread), 1);
        router.push('/messageboard');
      }.bind(this));
    },
  },

  computed: {

    // checkAuthor: function(inputBoardThread) {
    //   if this.inputBoardThread.created_by
    // }
    // sortedThreads: function() {
    //   if (this.sortDesc) {
    //     return this.boardThreads.sort(function(thread1, thread2) {
    //       return thread1[this.sortAttribute].localeCompare(thread2[this.sortAttribute]);
    //     }.bind(this));
    //   } else {
    //     return this.boardThreads.sort(function(thread1, thread2) {
    //       return thread2[this.sortAttribute].localeCompare(thread1[this.sortAttribute]);
    //     }.bind(this));
  //     }
  //   }
  }
};

// ===================================
// SHOW THREAD
// ===================================

var ShowThread = {
  template: "#show-thread",
  data: function() {
    return {
      posts: [],
      postText: ""
    };
  },

  created: function() {
    var params = {
      thread_id: this.$route.params
    };
    axios.get("/posts", params).then(function(response) {
      console.log(response.data);
      console.log(params);
      this.posts = response.data;
    }.bind(this));
  },

  methods: {
    createPost: function() {
      var params = {
        post_text: this.postText
      };
      axios.post("/posts", params).then(function(response) {
      }.bind(this));
    }
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
    { path: "/signup", component: SignUp },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    { path: "/dashboard", component: Dashboard },
    { path: "/useractions", component: UserActions },
    { path: "/useractions/new", component: NewUserAction },
    { path: "/locations", component: Locations},
    { path: "/locations/:id/edit", component: UpdateLocation},
    { path: "/locations/new", component: NewLocation},
    { path: "/messageboard", component: MessageBoard},
    { path: "/messageboard/:id", component: ShowThread},
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