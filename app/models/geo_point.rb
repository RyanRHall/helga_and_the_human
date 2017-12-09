class GeoPoint < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :geo_point, dependent: :destroy
  has_many :routes, through: :geo_point_routes
  has_one :description, primary_key: :slug, foreign_key: :slug, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  before_destroy(prepend: true) do
    routes.each { |route| route.destroy! }
  end

  def to_lat_lng
    { lat: lat, lng: lng }
  end

  def to_h
    to_lat_lng.merge(name: name)
  end
end
