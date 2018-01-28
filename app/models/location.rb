class Location < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  def address
    [street_address, city, state, zip].compact.join(', ')
  end


  def default?
    self.is_default = !self.is_default
  end

  # def find_default
  #   default_location = current_user.locations.find_by(default: true)
  #   render json: default_location.as_json
  # end

  # def change_default

  # end

end
