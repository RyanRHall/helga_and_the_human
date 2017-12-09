GeoPoint.destroy_all
Route.destroy_all
Photo.destroy_all
Tag.destroy_all
Description.destroy_all

GeoPoint.create!([
  { name: "San Francisco",              slug: :san_francisco, lat: 37.7749, lng: -122.4194 },
  { name: "Yosemite",                   slug: :yosemite,      lat: 37.7456, lng: -119.5936 },
  { name: "Moab",                       slug: :moab,          lat: 38.5733, lng: -109.5498 },
  { name: "Boulder",                    slug: :boulder,       lat: 40.0150, lng: -105.2705 },
  { name: "High Sierra Music Festival", slug: :high_sierra,   lat: 39.9368, lng: -120.9472 },
])

Route.create!([
  { geo_points: [GeoPoint.find_by(slug: :san_francisco), GeoPoint.find_by(slug: :yosemite)] },
  { geo_points: [GeoPoint.find_by(slug: :yosemite), GeoPoint.find_by(slug: :moab)] },
  { geo_points: [GeoPoint.find_by(slug: :moab), GeoPoint.find_by(slug: :boulder)] },
  { geo_points: [GeoPoint.find_by(slug: :boulder), GeoPoint.find_by(slug: :high_sierra)] },
])

prefix = "/assets/photos/"

Photo.create!([
  {
    img_path: prefix + "climbing1.jpg",
    thumbnail_path: prefix + "climbing1.jpg",
    caption: "test caption thing",
    tags_attributes: [{slug: :climbing}]
  }, {
    img_path: prefix + "climbing2.jpg",
    thumbnail_path: prefix + "climbing2.jpg",
    caption: "test caption thing2 test caption thing2 test caption thing2 test caption thing2 test caption thing2 test caption thing2 test caption thing2 test caption thing2",
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
    tags_attributes: [{slug: :yosemite}, {slug: :climbing}]
  }, {
    img_path: prefix + "yos2.jpg",
    thumbnail_path: prefix + "yos2.jpg",
    tags_attributes: [{slug: :yosemite}, {slug: :climbing}]
  },
])

Description.create!([
  {
    slug: :san_francisco,
    title: "San Francisco",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    slug: :yosemite,
    title: "Yo Se Mite",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    slug: :moab,
    title: "Moab",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    slug: :boulder,
    title: "Boulderrrr",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    slug: :high_sierra,
    title: "Las Montanas",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  {
    slug: :van,
    title: "The Van",
  },
  {
    slug: :climbing,
    title: "The Rocks",
  },
])
