class Route < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :route

  def geo_points=(geo_points)
    new_geo_point_routes = []
    geo_points.each_with_index do |geo_point, idx|
      new_geo_point_routes << GeoPointRoute.new(geo_point: geo_point, position: idx)
    end
    self.geo_point_routes = new_geo_point_routes
  end

end
