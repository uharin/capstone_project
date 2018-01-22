class UsersController < ApplicationController

  def index
    # api_info = Unirest.get('https://maps.googleapis.com/maps/api/js?key=#{ENV["API_KEY"]}&callback=initMap');
    # render json: api_info.as_json
    all_users = User.all
    render json: all_users.as_json
  end

  def create
    user = User.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      })
    if user.save
      Location.create({
        user_id: user.id,
        zip: params[:zip]
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
