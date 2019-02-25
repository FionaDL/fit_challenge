class User < ApplicationRecord
  has_many :challenges

  has_secure_password

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  




end
