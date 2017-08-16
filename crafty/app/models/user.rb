class User < ApplicationRecord
  has_many :crafts

  has_secure_password
end
