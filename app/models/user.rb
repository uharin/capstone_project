class User < ApplicationRecord

# Database Associations 
  has_many :locations
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :posts
  has_many :board_threads

# Authentication
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def get_name
    "#{first_name} #{last_name}"
  end

  def as_json(input_user)

  # GET LOCAL USERS FOR LEADERBOARD
  # ========================================
  # find current user default location city and state
    current_city = input_user.locations.find_by(is_default: true).city
    current_state = input_user.locations.find_by(is_default: true).state
    current_latitude = input_user.locations.find_by(is_default: true).latitude
    current_longitude = input_user.locations.find_by(is_default: true).longitude

  # find all local addresses where city is current_city and default is true. Returns array
    local_addresses = Location.where(city: current_city, is_default: true)

    # create an array and shovel in first name, last name, and points of all local users
    local_users = []
    local_addresses.each do |location|
      user_hash = {}
      user_hash[:name] = location.user.get_name
      user_hash[:points] = location.user.points
      local_users << user_hash
    end
    
    # sort local users in descending order to get top 10
    sorted_local_users = local_users.sort_by! { |k| k[:points] }.reverse!

    # get last user_action for dashboard
    last_action = UserAction.last

    # get last user_action for dashboard
    posts = input_user.posts
    last_post = posts.last
    p "PRINTING LAST POST"
    p last_post

  # =========================================
    {
      name: get_name,
      email: email,
      points: points,
      local_users: local_users.as_json,
      city: current_city,
      state: current_state,
      latitude: current_latitude,
      longitude: current_longitude,
      last_action: last_action.as_json,
      last_post: last_post.as_json
    }
  end
    
end

