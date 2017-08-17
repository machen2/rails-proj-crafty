class Craft < ApplicationRecord
  belongs_to :user
  has_many :craft_tags
  has_many :tags, through: :craft_tags

  validates_presence_of :title, :difficulty, :description, :instructions
  validates :difficulty, inclusion: { in: %w(easy medium hard), message: "%{value} is not a valid difficulty" }
end
