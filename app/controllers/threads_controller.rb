class ThreadsController < ApplicationController
  before_action :authenticate_user

  def index

  # find current user default location city 
    current_city = current_user.locations.find_by(is_default: true).city
    p "Current city"
    p current_city

  # find all locations where city is current_city and default is true. Returns array
    local_city = Location.where(city: current_city, is_default: true )

  # loops through local_city array and shovels each user with current city into new array, local_users. Returns array of users who have default citys like current user
    local_users = []
    local_city.each do |location|
      local_users << location.user
    end
    p "Local users"
    p local_users


  # loops through array and returns id of local_users
    local_user_ids = []
    local_users.each do |user|
      local_user_ids << user.id
    end

  # gets threads where thread was created by local user
    local_threads = BoardThread.where(user_id: local_user_ids)

    render json: local_threads.as_json
  end

  def show
    p "I am in the show"
    thread_posts = Posts.all.where(board_thread_id: params[:id])
    p "thread is the following:"
    p thread
    render json: thread_posts.as_json
  end

  def create
    thread = BoardThread.new({
      title: params[:title],
      user_id: current_user[:id]
      })
    if thread.save
      Post.create!(
        user_id: current_user.id,
        post_text: params[:post_text],
        board_thread_id: thread.id
        )
    end
  end

  def destroy
    thread = BoardThread.find_by(id: params[:id])
    thread.destroy
  end

  def update

  end


end
