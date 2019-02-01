class Workout < ApplicationRecord
  has_many :challenge_workouts
  has_many :challenges, through: :challenge_workouts

end
