class GeoPoint < ActiveRecord::Base
  has_many :geo_point_routes, inverse_of: :geo_point, dependent: :destroy
  has_many :routes, through: :geo_point_routes, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  def to_lat_lng
    { lat: lat, lng: lng }
  end

  def to_h
    to_lat_lng.merge(name: name)
  end
end
