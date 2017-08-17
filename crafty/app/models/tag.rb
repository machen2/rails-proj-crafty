class Tag < ApplicationRecord
  has_many :craft_tags
  has_many :crafts, through: :craft_tags

  validates_uniqueness_of :name
end
