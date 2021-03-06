class LocationsController < ApplicationController
  before_action :authenticate_user

  def index
    locations = current_user.locations
    render json: locations.as_json
  end

  def create
    location = Location.new({
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      user_id: current_user[:id],
      is_default: params[:is_default]
      })
    if location.is_default != false and Location.all.where(user_id: current_user.id).empty?
      p "I made it inside the if"
      location.save
    elsif location.is_default == false and Location.all.where(user_id:current_user.id).any?
      p "I made it inside the else"
      location.save
    else
      old_default = Location.find_by(is_default: true, user_id: current_user.id)
      old_default.default?
      old_default.save
      location.save
    end
    # if location.save
      # p "I saved!"
    render json: location.as_json
    # end
  end

  def show
    p "I am in the show"
    if params[:id] == "get-my-location"
      location = Location.find_by(is_default: true)
      p "location is the following:"
      p location
    end
    render json: location.as_json
  end
  
  def edit
    location = Location.find_by(params[:id])
  end
  
  def update
    location = Location.find_by(id: params[:id])

    if location.is_default != false and Location.all.where(user_id: current_user.id).empty?
      p "I made it inside the if"
      location.save
    # elsif location.is_default == false and Location.all.where(user_id: current_user.id, is_default: true).any?
    #   p "I made it inside the else"
    #   location.save
    elsif location.is_default == false and Location.all.where(user_id: current_user.id, is_default:true).empty?
      location.default?
      location.save
    else
      old_default = Location.find_by(is_default: true, user_id: current_user.id)
      old_default.default?
      old_default.save
      location.default?
      location.save
    end
  end

  def destroy
    location = Location.find_by(id: params[:id])
    location.destroy
    if Location.all.where(is_default:true, user_id:current_user.id).empty?
      location_default = Location.find_by(user_id: current_user.id)
      location_default.default?
      location_default.save
    end 
  end

  def find_default
    default_location = current_user.locations.find_by(is_default: true)
    render json: default_location.as_json
  end

end
