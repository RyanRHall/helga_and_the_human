class GeoPoint < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :geo_point

  def to_lat_lng
    { lat: lat, lng: lng }
  end
end
