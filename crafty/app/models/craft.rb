class Craft < ApplicationRecord
  belongs_to :user
  has_many :craft_tags
  has_many :tags, through: :craft_tags

  validates_presence_of :title, :difficulty, :description, :instructions
  validates :difficulty, inclusion: { in: %w(easy medium hard), message: "%{value} is not a valid difficulty" }

  def tags_attributes=(tags_attributes)
    tags_attributes.values.each do |tag_attributes|
      tag = Tag.find_or_create_by(tag_attributes)
      tags << tag if tag.persisted? && !tag.name.blank? && !tags.include?(tag)
   end
  end
end
