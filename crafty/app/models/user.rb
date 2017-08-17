class User < ApplicationRecord
  has_many :crafts

  has_secure_password

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: /@/, message: "address is invalid." }, uniqueness: true
  validates :password, length: { minimum: 6 }
end
