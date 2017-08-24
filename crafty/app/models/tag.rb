class Tag < ApplicationRecord
  has_many :craft_tags
  has_many :crafts, through: :craft_tags

  validates_uniqueness_of :name

  def self.most_popular_tags
    @max = 0
    Tag.all.each do |tag|
      if tag.crafts.count > @max
        @max = tag.crafts.count
      end
    end
    @most_popular = Tag.all.select { |tag| tag.crafts.count == @max }
  end
end
