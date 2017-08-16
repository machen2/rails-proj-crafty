class Craft < ApplicationRecord
  belongs_to :user
  has_many :craft_tags
  has_many :tags, through: :craft_tags
end
