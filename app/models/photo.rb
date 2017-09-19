class Photo < ActiveRecord::Base
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :photo_group_photos, dependent: :destroy, inverse_of: :photo
  has_many :photo_groups, through: :photo_group_photos
  accepts_nested_attributes_for :tags
end
