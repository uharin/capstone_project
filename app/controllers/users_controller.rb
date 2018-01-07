class UsersController < ApplicationController

  def index
    all_users = User.all
    render json: all_users.as_json
  end

  def create
    user = User.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username]
      })
    if user.save
      Address.new({
        city: params[:city]
        })
      render json: user.as_json
    else
      render json: user.errors.full_messages
    end
  end

  def destroy
    user_id = params[:id]
    user = User.find_by(id: user_id)
    user.destroy
  end

  def update

  end

end
