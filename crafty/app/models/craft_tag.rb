class CraftTag < ApplicationRecord
  belongs_to :tag
  belongs_to :craft
end
