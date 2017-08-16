class Tag < ApplicationRecord
  has_many :craft_tags
  has_many :crafts, through: :craft_tags
end
