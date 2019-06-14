class User < ApplicationRecord
  has_many :challenges

  has_secure_password

  



end
