json.routes do
  json.array! @routes do |route|
    json.origin route.origin.to_lat_lng
    json.destination route.destination.to_lat_lng
    json.waypoints { json.array! route.waypoints.map(&:to_lat_lng) }
  end
end
