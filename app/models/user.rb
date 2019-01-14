class User < ApplicationRecord
  has_many :challenges
  has_many :workouts, through: :challenges

  has_secure_password

end
