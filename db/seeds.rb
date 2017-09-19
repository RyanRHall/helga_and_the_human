GeoPoint.destroy_all
Route.destroy_all
Photo.destroy_all
PhotoGroup.destroy_all
Tag.destroy_all

GeoPoint.create!([
  { name: "San Francisco",              slug: :san_francisco, lat: 37.7749, lng: -122.4194 },
  { name: "Yosemite",                   slug: :yosemite,      lat: 37.7456, lng: -119.5936 },
  { name: "Moab",                       slug: :moab,          lat: 38.5733, lng: -109.5498 },
  { name: "Boulder",                    slug: :boulder,       lat: 40.0150, lng: -105.2705 },
  { name: "High Sierra Music Festival", slug: :high_sierra,   lat: 39.9368, lng: -120.9472 },
])

Route.create!([
  { title: "Goodbye SF!", date: Date.parse("2017-5-5"), geo_points: [GeoPoint.find_by(slug: :san_francisco), GeoPoint.find_by(slug: :yosemite)] },
  { title: "Yosemite to Moab", date: Date.parse("2017-5-20"), geo_points: [GeoPoint.find_by(slug: :yosemite), GeoPoint.find_by(slug: :moab)] },
  { title: "Moab to Boulder", date: Date.parse("2017-5-20"), geo_points: [GeoPoint.find_by(slug: :moab), GeoPoint.find_by(slug: :boulder)] },
  { title: "Boulder to High Sierra", date: Date.parse("2017-6-10"), geo_points: [GeoPoint.find_by(slug: :boulder), GeoPoint.find_by(slug: :high_sierra)] },
])

prefix = "/assets/photos/"

Photo.create!([
  {
    img_path: prefix + "climbing1.jpg",
    thumbnail_path: prefix + "climbing1.jpg",
    tags_attributes: [{slug: :climbing}]
  }, {
    img_path: prefix + "climbing2.jpg",
    thumbnail_path: prefix + "climbing2.jpg",
    tags_attributes: [{slug: :climbing}]
  }, {
    img_path: prefix + "sf1.jpg",
    thumbnail_path: prefix + "sf1.jpg",
    tags_attributes: [{slug: :san_francisco}]
  }, {
    img_path: prefix + "sf2.jpg",
    thumbnail_path: prefix + "sf2.jpg",
    tags_attributes: [{slug: :san_francisco}]
  }, {
    img_path: prefix + "van1.jpg",
    thumbnail_path: prefix + "van1.jpg",
    tags_attributes: [{slug: :van}]
  }, {
    img_path: prefix + "yos1.jpg",
    thumbnail_path: prefix + "yos1.jpg",
    tags_attributes: [{slug: :yosemite}]
  }, {
    img_path: prefix + "yos2.jpg",
    thumbnail_path: prefix + "yos2.jpg",
    tags_attributes: [{slug: :yosemite}]
  },
])

PhotoGroup.create!([
  { name: "Yosemite",
    photos: Photo.where('img_path LIKE ?', '%yos%'),
    tags_attributes: [{slug: :climbing}]
  }
])
