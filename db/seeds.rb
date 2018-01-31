# ========================
# Create Users
# ========================

# 20.times do
#   User.create({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     password_digest: Faker::Internet.password,
#     location_id: Faker::Number.between(1, 2)
#   })
# end

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

BoardThread.create!({user_id: 1, title:"Lorem ipsum dolor amet jean shorts air plant narwhal authentic"})
BoardThread.create!({user_id: 1, title:"YOLO taiyaki master cleanse celiac"})
BoardThread.create!({user_id: 1, title:"pressed af +1 freegan affogato raclette"})
BoardThread.create!({user_id: 1, title:"lyft church-key adaptogen "})
BoardThread.create!({user_id: 1, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
BoardThread.create!({user_id: 1, title:"Skateboard kogi iPhone try-hard forage"})
BoardThread.create!({user_id: 1, title:"santo drinking vinegar gluten-free. Kogi taxidermy"})
BoardThread.create!({user_id: 1, title:"YOLO taiyaki master cleanse celiac"})
BoardThread.create!({user_id: 1, title:"Twee kitsch readymade"})
BoardThread.create!({user_id: 1, title:"Organic vaporware semiotics vegan"})
BoardThread.create!({user_id: 1, title:"Small batch vegan iPhone enamel pin. Tilde shaman pabst pitchfork."})
BoardThread.create!({user_id: 1, title:"Svinyl pinterest tacos "})

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

#
# 100.times do
#   Location.create!({
#   street_address: Faker::Address.street_address, 
#   city: Faker::Address.city, 
#   state: Faker::Address.state_abbr, 
#   zip: Faker::Address.zip,
#   user_id: 1})
# end
