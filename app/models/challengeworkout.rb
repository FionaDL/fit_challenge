class Challengeworkout < ApplicationRecord
  belongs_to :challenge
  belongs_to :workout

  validates :workout_duration, presence: true
  validates :challenge_id, presence: true
  validates :workout_id, presence: true


end
