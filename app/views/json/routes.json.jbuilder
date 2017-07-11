json.routes do
  json.array! @routes do |route|
    json.origin route.origin.to_lat_lng
    json.destination route.destination.to_lat_lng
    json.waypoints { json.array! route.waypoints.map(&:to_lat_lng) }
  end
end

json.geoPoints do
  json.array! @geo_points do |geo_point|
    json.extract! geo_point, :name, :lat, :lng, :slug
  end
end
