class PostsController < ApplicationController
  before_action :authenticate_user

  def create
    post = Post.create({
      title: params[:title],
      body: params[:body]
      })
      })
  end

  def destroy

  end

  def update

  end

end
