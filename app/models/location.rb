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

end
