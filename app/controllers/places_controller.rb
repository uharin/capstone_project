class PlacesController < ApplicationController
  def index
    places = Unirest.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=recycling&key=AIzaSyBMBUT0oQAIGD9QdMdVp8oJESiOgG9TecA&location=40.4406,-79.9959")
    results = places.body["results"]
    render json: results.as_json
  end
end
