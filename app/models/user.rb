class User < ApplicationRecord
  has_many :challenges

  has_secure_password

  validates :name, presence: true
  validates :password, presence: true



end
