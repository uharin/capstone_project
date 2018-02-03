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

Post.create!({user_id: 1, board_thread_id: 2})
Post.create!({user_id: 2, board_thread_id: 4})
Post.create!({user_id: 3, board_thread_id: 2})
Post.create!({user_id: 3, board_thread_id: 3})
Post.create!({user_id: 2, board_thread_id: 4})
Post.create!({user_id: 1, board_thread_id: 5})

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

# BoardThread.create!({user_id: 1, title:"Lorem ipsum dolor amet jean shorts air plant narwhal authentic"})
# BoardThread.create!({user_id: 1, title:"YOLO taiyaki master cleanse celiac"})
# BoardThread.create!({user_id: 1, title:"pressed af +1 freegan affogato raclette"})
# BoardThread.create!({user_id: 1, title:"lyft church-key adaptogen "})
# BoardThread.create!({user_id: 1, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
# BoardThread.create!({user_id: 1, title:"Skateboard kogi iPhone try-hard forage"})
# BoardThread.create!({user_id: 1, title:"santo drinking vinegar gluten-free. Kogi taxidermy"})
# BoardThread.create!({user_id: 1, title:"YOLO taiyaki master cleanse celiac"})
# BoardThread.create!({user_id: 1, title:"Twee kitsch readymade"})
# BoardThread.create!({user_id: 1, title:"Organic vaporware semiotics vegan"})
# BoardThread.create!({user_id: 1, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
# BoardThread.create!({user_id: 1, title:"Svinyl pinterest tacos "})

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

# Location.create!({street_address: "835 Boggs Avenue", city: "Pittsburgh", state: "PA", zip: "15211", user_id: 21})
# Location.create!({street_address: "231 Roup Avenue", city: "Pittsburgh", state: "PA", zip: "15206", user_id: 22})
# Location.create!({street_address: "180 Wynne Stret", city: "Pittsburgh", state: "PA", zip: "15209", user_id: 23})
# Location.create!({street_address: "6746 Wilkins Avnue", city: "Pittsburgh", state: "PA", zip: "15217", user_id: 24})
# Location.create!({street_address: "716 Gypsy Lane", city: "Pittsburgh", state: "PA", zip: "15228", user_id: 25})
# Location.create!({street_address: "218 Tennyson Avenue", city: "Pittsburgh", state: "PA", zip: "15213", user_id: 26})
# Location.create!({street_address: "620 Cabot Way", city: "Pittsburgh", state: "PA", zip: "15203", user_id: 27})
# Location.create!({street_address: "1287 Clairhaven Street", city: "Pittsburgh", state: "PA", zip: "15205", user_id: 28})
# Location.create!({street_address: "1626 Cumberland Street", city: "Pittsburgh", state: "PA", zip: "15205", user_id: 29})

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