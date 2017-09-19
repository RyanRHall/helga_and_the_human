class PhotoGroupPhoto < ActiveRecord::Base
  belongs_to :photo, inverse_of: :photo_group_photos
  belongs_to :photo_group, inverse_of: :photo_group_photos
end
