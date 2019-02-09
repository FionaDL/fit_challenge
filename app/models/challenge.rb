class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challengeworkouts
  has_many :workouts, through: :challengeworkouts

  def add_workout(workout)
    @workouts = @challenge.workouts
    @workouts << workout
    @workouts.save
  end

  def left_to_complete(workouts_needed)
    workouts_needed - self.workouts.size
  end


end
