class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    posts = Post.all.where(board_thread_id: params[:id]).order(:created_at)
    render json: posts.as_json
  end

  def create
    post = Post.new({
      user_id: current_user[:id],
      post_text: params[:post_text],
      board_thread_id: params[:board_thread_id]
      })
    post.save
    render json: post.as_json
  end

  def destroy

  end

  def update

  end

end
