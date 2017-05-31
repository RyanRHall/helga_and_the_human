class GeoPoint < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :geo_point
end
