class ThreadsController < ApplicationController
  before_action :authenticate_user

  def index
    all_threads = BoardThread.all
    # .where() && current_user.locations.is_default == true)
    render json: all_threads.as_json
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
      title: params[:title]
      })
  end

  def destroy
    thread_id = params[:id]
    thread = BoardThread.find_by(id: thread_id)
    thread.destroy
  end

  def update

  end


end
