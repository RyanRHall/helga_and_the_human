class Tag < ActiveRecord::Base
  belongs_to :photo

  validates :slug, uniqueness: { scope: :photo_id }
end
