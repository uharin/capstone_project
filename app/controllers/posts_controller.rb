class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    posts = Post.all.where(board_thread_id: params[:id])
    render json: posts_as_json
  end

  def create
    post = Post.create({
      title: params[:title],
      body: params[:body]
      })
  end

  def destroy

  end

  def update

  end

end
