GeoPoint.create!([
  { name: "San Fran", lat: 37.7749, lng: -122.4194 },
  { name: "Yosemite", lat: 37.7456, lng: -119.5936 },
  { name: "Moab", lat: 38.5733, lng: -109.5498 }
])

Route.create!([
  { title: "Goodbye SF!", date: Date.parse("2017-5-5"), geo_points: [GeoPoint.find(1), GeoPoint.find(2)] },
  { title: "Yosemite to Moab", date: Date.parse("2017-5-20"), geo_points: [GeoPoint.find(2), GeoPoint.find(3)] },
])
