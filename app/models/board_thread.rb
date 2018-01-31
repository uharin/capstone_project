class BoardThread < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  belongs_to :user

  def convert_time(datetime)
    time = Time.parse(datetime.to_s).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%A, %B %e, %Y: %l:%M%P")
  end
  
  def as_json
    {
    title: title,
    created_at: convert_time(created_at),
    posted_by: user.get_name,
    # text: posts.post_text
    }
  end

  # def find_local_threads
  # # find current user default location city 
  #   current_city = current_user.locations.find_by(is_default: true).city
  #   p "Current city"
  #   p current_city

  # # find all locations where city is current_city and default is true. Returns array
  #   local_city = Location.where(city: current_city, is_default: true )

  # # loops through local_city array and shovels each user with current city into new array, local_users. Returns array of users who have default citys like current user
  #   local_users = []
  #   local_city.each do |location|
  #     local_users << location.user
  #   end
  #   p "Local users"
  #   p local_users


  # # loops through array and returns id of local_users
  #   local_user_ids = []
  #   local_users.each do |user|
  #     local_user_ids << user.id
  #   end

  # # gets threads where thread was created by local user
  #   local_threads = BoardThread.where(user_id: local_user_ids)

  # end


end
