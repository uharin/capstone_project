class PlacesController < ApplicationController
  def index
    default_location = current_user.locations.find_by(is_default: true)
    places = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=recycling&key=AIzaSyBMBUT0oQAIGD9QdMdVp8oJESiOgG9TecA&location=#{default_location.latitude},#{default_location.longitude}")
    results = places.body["results"]
    render json: results.as_json
  end
end
