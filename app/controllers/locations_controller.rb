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
    if location.is_default != false
      old_default = Location.find_by(is_default: true, user_id: current_user.id)
      old_default.default?
      old_default.save
    end
    if location.save
      render json: location.as_json
    end
  end

  def show
    p "I am in the show"
    if params[:id] == "get-my-location"
      location = Location.find_by(is_default: true 
        # user_id: current_user.id
        )
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
    # location.update(
    #   street_address: params[:street_address],
    #   city: params[:city],
    #   state: params[:state],
    #   zip: params[:zip]
    # )
    if location.is_default == false
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
  end

  def find_default
    default_location = current_user.locations.find_by(is_default: true)
    render json: default_location.as_json
  end

end
