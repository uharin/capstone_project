# ========================
# Create Users
# ========================

# 10.times do
#   User.create({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     password_digest: Faker::Internet.password
#   })
# end

# ========================
# Create Posts
# ========================

Post.create!({user_id: 1, board_thread_id: 51})
Post.create!({user_id: 1, board_thread_id: 51})
Post.create!({user_id: 1, board_thread_id: 52})
Post.create!({user_id: 1, board_thread_id: 53})
Post.create!({user_id: 1, board_thread_id: 54})
Post.create!({user_id: 1, board_thread_id: 55})
Post.create!({user_id: 1, board_thread_id: 55})
Post.create!({user_id: 1, board_thread_id: 58})
Post.create!({user_id: 1, board_thread_id: 52})
Post.create!({user_id: 1, board_thread_id: 53})
Post.create!({user_id: 1, board_thread_id: 54})
Post.create!({user_id: 1, board_thread_id: 55})
Post.create!({user_id: 1, board_thread_id: 51})
Post.create!({user_id: 1, board_thread_id: 51})
Post.create!({user_id: 1, board_thread_id: 12})
Post.create!({user_id: 1, board_thread_id: 13})
Post.create!({user_id: 1, board_thread_id: 14})
Post.create!({user_id: 1, board_thread_id: 18})
Post.create!({user_id: 1, board_thread_id: 11})
Post.create!({user_id: 1, board_thread_id: 11})
Post.create!({user_id: 1, board_thread_id: 12})
Post.create!({user_id: 1, board_thread_id: 13})
Post.create!({user_id: 1, board_thread_id: 14})
Post.create!({user_id: 1, board_thread_id: 15})

# ========================
# Create Posts
# ========================

# Post.create!({user_id: 1, board_thread_id: 2})
# Post.create!({user_id: 2, board_thread_id: 4})
# Post.create!({user_id: 3, board_thread_id: 2})
# Post.create!({user_id: 3, board_thread_id: 3})
# Post.create!({user_id: 2, board_thread_id: 4})
# Post.create!({user_id: 1, board_thread_id: 5})

# ========================
# Create User_Actions
# ========================

# UserAction.create({user_id: 9, action_id: 1})
# UserAction.create({user_id: 9, action_id: 3})
# UserAction.create({user_id: 9, action_id: 4})
# UserAction.create({user_id: 9, action_id: 2})
# UserAction.create({user_id: 9, action_id: 1})
# UserAction.create({user_id: 3, action_id: 3})
# UserAction.create({user_id: 3, action_id: 4})
# UserAction.create({user_id: 10, action_id: 1})
# UserAction.create({user_id: 8, action_id: 3})

# ========================
# Create Board_Threads
# ========================

# BoardThread.create!({user_id: 51, title:"Lorem ipsum dolor amet jean shorts air plant narwhal authentic"})
# BoardThread.create!({user_id: 52, title:"YOLO taiyaki master cleanse celiac"})
# BoardThread.create!({user_id: 53, title:"pressed af +1 freegan affogato raclette"})
# BoardThread.create!({user_id: 54, title:"lyft church-key adaptogen "})
# BoardThread.create!({user_id: 55, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
# BoardThread.create!({user_id: 56, title:"Skateboard kogi iPhone try-hard forage"})
# BoardThread.create!({user_id: 58, title:"santo drinking vinegar gluten-free. Kogi taxidermy"})
# BoardThread.create!({user_id: 51, title:"YOLO taiyaki master cleanse celiac"})
# BoardThread.create!({user_id: 52, title:"Twee kitsch readymade"})
# BoardThread.create!({user_id: 52, title:"Organic vaporware semiotics vegan"})
# BoardThread.create!({user_id: 53, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
# BoardThread.create!({user_id: 54, title:"Svinyl pinterest tacos "})

# ========================
# Create Actions
# ========================

# Action.create({action_name:"recycle", point_value: 50})
# Action.create({action_name:"donate", point_value: 200})
# Action.create({action_name:"cycle", point_value: 100})
# Action.create({action_name:"carpool", point_value: 150})


# ========================
# Create Addresses
# ========================

# Location.create!({street_address: "4227 30th Ave", city: "Seattle", state: "WA", zip: "98199", user_id: 50})
# Location.create!({street_address: "2658 9th Avenue", city: "Seattle", state: "WA", zip: "98119", user_id: 51})
# Location.create!({street_address: "725 14th Avenue East", city: "Seattle", state: "WA", zip: "98112", user_id: 52})
# Location.create!({street_address: "5659 42nd Avenue", city: "Seattle", state: "WA", zip: "98199", user_id: 53})
# Location.create!({street_address: "899 NW Eldford Drive", city: "Seattle", state: "WA", zip: "98177", user_id: 54})
# Location.create!({street_address: "3426 Renton Pl Street", city: "Seattle", state: "WA", zip: "98144", user_id: 55})
# Location.create!({street_address: "3842 25th Avenue West", city: "Seattle", state: "WA", zip: "15203", user_id: 56})
# Location.create!({street_address: "1940 N Northgate Way", city: "Seattle", state: "WA", zip: "98133", user_id: 57})
# Location.create!({street_address: "3739 SW Thistle Street", city: "Seattle", state: "WA", zip: "98126", user_id: 58})

# Location.create!({ street_address: "161 Pine Street", city: "Portland", state: "ME", zip: "04102", user_id: 39})
# Location.create!({ street_address: "510 Auburn Street", city: "Portland", state: "ME", zip: "04103", user_id: 40})
# Location.create!({ street_address: "31 Longwood Drive", city: "Portland", state: "ME", zip: "04102", user_id: 41})
# Location.create!({ street_address: "96 Vesper Street", city: "Portland", state: "ME", zip: "04101", user_id: 42 })
# Location.create!({ street_address: "135 Murray Street", city: "Portland", state: "ME", zip: "04103", user_id: 43})
# Location.create!({ street_address: "21 Rowe Avenue", city: "Portland", state: "ME", zip: "04102", user_id: 44})
# Location.create!({ street_address: "410 Chandlers Wharf", city: "Portland", state: "ME", zip: "04101", user_id: 45})
# Location.create!({ street_address: "225 Bracket Avenue", city: "Portland", state: "ME", zip: "04108", user_id: 46})
# Location.create!({ street_address: "97 Belfort Street", city: "Portland", state: "ME", zip: "04101", user_id: 47})
# Location.create!({ street_address: "26 Concord Street", city: "Portland", state: "ME", zip: "04103", user_id: 48})