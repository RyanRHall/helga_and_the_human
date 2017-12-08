class Photo < ActiveRecord::Base

  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true

  validates :tags, presence: true

  def tag_slugs
    tags.map(&:slug).join(";")
  end

  def tag_slugs=(tag_slugs)
    current_slugs = tags.map(&:slug)
    slugs = tag_slugs.downcase.split(";")
    slugs_to_delete = current_slugs - slugs
    slugs_to_add = slugs - current_slugs
    slugs_to_delete.map! do |slug|
      tag = tags.find { |tag| tag.slug == slug }
      { id: tag.id, _destroy: true }
    end
    slugs_to_add.map! { |slug| { slug: slug } }
    self.tags_attributes = slugs_to_delete + slugs_to_add
  end

end
