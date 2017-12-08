class Route < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :route, dependent: :destroy
  has_many :geo_points, through: :geo_point_routes, source: :geo_point


  def geo_points=(geo_points)
    new_geo_point_routes = []
    geo_points.each_with_index do |geo_point, idx|
      new_geo_point_routes << GeoPointRoute.new(geo_point: geo_point, position: idx)
    end
    self.geo_point_routes = new_geo_point_routes
  end

  def origin
    geo_points.first
  end

  def destination
    geo_points.last
  end

  def waypoints
    geo_points[1...-1]
  end

end
