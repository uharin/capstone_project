class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    posts = Post.all
    # .where(board_thread_id: params[:id])
    render json: posts.as_json
  end

  def create
    post = Post.create({
      user_id: current_user[:id],
      post_text: params[:post_text],
      board_thread_id: 2
      })
  end

  def destroy

  end

  def update

  end

end
