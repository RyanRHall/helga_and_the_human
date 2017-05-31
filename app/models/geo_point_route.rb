class GeoPointRoute < ActiveRecord::Base
  belongs_to :route, inverse_of: :geo_point_routes
  belongs_to :geo_point, inverse_of: :geo_point_routes
end
