class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_workouts
  has_many :workouts, through: :challenge_workouts

  def add_workout(workout)
    @workouts = @challenge.workouts
    @workouts << workout
    @workouts.save
  end

end
