/* global Vue, VueRouter, axios, google $ Highcharts */

// ===================================
// HOMEPAGE
// ===================================

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
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
      places: [],
      user: {
        name: "",
        email: "",
        points: "",
        local_users: [],
        last_action: {
          name: "",
          amount: "",
          created_at: "",
          point_value: "",
          sum: ""
        },
        last_post: {
          board_thread: "",
          created_at: "",
          post_text: "",
          posted_by: ""
        }
      },
      userMap: null
    };
  },

  created: function() {
    // Have to run this so dashboard data is available
    axios.get('/users/:id').then(function(response) {
      this.user = response.data;
      console.log(this.user);
    }.bind(this));
  },

  mounted: function() {

    axios.get('/users/:id').then(function(response) {
      this.user = response.data;
      var loggedUser = this.user;
      console.log(loggedUser);
      var localUsers = this.user.local_users;
      console.log(localUsers);
      
      // maybe come back to this to reduce code 
      // var mappedPoints = [];
      // for (var i = 0; i < 10; i++) {
      //   mappedPoints.push([localUsers[i].name][localUsers[i].points]);
      // }

      var myChart = Highcharts.chart('map-container', {
        chart: {
          type: 'column',
          reflow: true
        },
        title: {
          text: 'Top 10 players in ' + loggedUser.city
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
      
        var initMap = function(user, places) {

          // create map and center on user lat, lng
          var userLocation = {lat: user.latitude, lng: user.longitude};
          var map = new google.maps.Map(document.getElementById('userMap'), {
            zoom: 12,
            center: userLocation,
            scrollwheel: false,
          });
          var userMarker = new google.maps.Marker({
            position: userLocation,
            map: map,
          });
          var userMarkerInfo = new google.maps.InfoWindow({
            content: '<div class="userMap"><h6>' + "Your location" + '</h6> </div>',
            disableAutoPan: true
          });
          userMarker.addListener('mouseover', function() {
            userMarkerInfo.open(map, userMarker);
          });
          userMarker.addListener('mouseover', function() {
            userMarkerInfo.close(map, userMarker);
          });

          // set custom icon
          var icon = {
            url: "/img/recycling.png", // url
            scaledSize: new google.maps.Size(30, 30), //  size
          };
          
          // loop through places and create new markers for each
          for (var i = 0; i < places.length; i++) {
            var location = places[i].geometry.location;
            var placeName = places[i].name;
            var marker = new google.maps.Marker({
              position: location,
              map: map,
              icon: icon
            });
            marker.info = new google.maps.InfoWindow({
              content: '<div class="userMap"><h6>' + placeName + '</h6> </div>',
              disableAutoPan: true
            });
            google.maps.event.addListener(marker, 'mouseover', function() {
              this.info.open(map,this);
            });
            google.maps.event.addListener(marker, 'mouseout', function() {
              this.info.close(map,this );
            });
          }
        };
        // Use JQuery to wait until document loads, then run initMap()
        // ==============================
        $(document).ready(function() {
          initMap(loggedUser, recylingPlaces);
  
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
        alert("You've added a new location in: " + this.location.city + ", " + this.location.state);
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
      this.userActions.reverse()
    }.bind(this));
  },

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
      totalPoints: "",
      pointValue: 0,
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
  },
  computed: {

    calcPoints: function() {
      if (this.actionOption === "1") {
        var pointValue = 50;
      } else if (this.actionOption === "2" ) {
        pointValue = 200;
      } else if (this.actionOption === "4") {
        pointValue = 150;
      }
      return this.amount * pointValue;
    },
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
      }.bind(this));

      axios.get('/threads').then(function(response) {
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
      boardPosts: [],
      newPost: {}
    };
  },

  created: function() {

    axios.get("/threads/" + this.$route.params.id).then(function(response) {
      this.boardPosts = response.data;
    }.bind(this));

  // I know :id isn't doing anything, but it helps me know what it's doing on the back end + matches right route
    axios.get('/users/:id').then(function(response) {
      console.log(response.data);
      this.current_user = response.data;
    }.bind(this));
  },
  
  methods: {

    createPost: function() {
      var params = {
        post_text: this.newPost.postText,
        board_thread_id: this.$route.params.id
      };

      axios.post("/posts", params).then(function(response) {
        console.log(this.boardPosts[0]);
        console.log(this.newPost);
        console.log(response);
        this.boardPosts.push(response.data);
      }.bind(this));
    },

    deletePost: function(inputPost) {
      var params = {
        post_id: inputPost.id
      };
      axios.delete('/posts/' + inputPost.id).then(function(response) {
        this.boardPosts.splice(this.boardPosts.indexOf(inputPost), 1);
        router.push('/threads/');
      }.bind(this));
    },

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
      errors: [],
      showNav: false
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
      errors: [],
      showNav: false
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
    { path: "/", component: Login },
    { path: "/signup", component: SignUp },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout},
    { path: "/dashboard", component: Dashboard },
    { path: "/useractions", component: UserActions},
    { path: "/useractions/new", component: NewUserAction },
    { path: "/locations", component: Locations},
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
  data: {
    user: {},
    showNav: false
  },
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }

    // axios.get('/users/:id').then(function(response) {
    //   this.user = response.data;
    // }.bind(this));

  }
});