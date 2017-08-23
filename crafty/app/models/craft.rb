class Craft < ApplicationRecord
  belongs_to :user
  has_many :craft_tags
  has_many :tags, through: :craft_tags

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? } ## for temporary use, need to use custom attribute writer

  validates_presence_of :title, :difficulty, :description, :instructions
  validates :difficulty, inclusion: { in: %w(easy medium hard), message: "%{value} is not a valid difficulty" }
end
