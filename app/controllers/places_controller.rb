class PlacesController < ApplicationController
  def index
    default_location = current_user.locations.find_by(is_default: true)
    p "PRINTING DEFAULT LOCATION"
    pp default_location
    places = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=recycling&key=AIzaSyAM-7qIRZu5xUOMm9uU4fihfKSr7ZvHVfc&location=#{default_location.latitude},#{default_location.longitude}")
    results = places.body["results"]
    pp results
    render json: results.as_json
  end
end
