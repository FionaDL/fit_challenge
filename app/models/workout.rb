class Workout < ApplicationRecord
  has_many :challengeworkouts
  has_many :challenges, through: :challengeworkouts

  validates :kind, presence: true
  
end
