class Location < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode

  def address
    address = "#{street_address} #{city} #{state} #{zip}"
    return address
  end

end
