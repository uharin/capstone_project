class LocationsController < ApplicationController
  before_action :authenticate_user

  def index
    locations = current_user.locations
    render json: locations.as_json
  end

  def new

  end

  def create
    p current_user
    location = Location.new({
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      user_id: current_user[:id]
      })
    if location.save
      render json: location.as_json
    else
      render json: location.errors.full_messages
    end
  end

  def show
    address_id = params[:id]
    location = Location.find_by(id: params[:location_id])
    render json: location.as_json
  end
  
  def edit

  end
  
  def update
    location = Location.find_by(id: params[:location_id])
    location.update(
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
    )
  end

  def destroy
    location = Location.find_by(id: params[:id])
    location.destroy
  end


end
