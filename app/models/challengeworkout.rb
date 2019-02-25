class Challengeworkout < ApplicationRecord
  belongs_to :challenge
  belongs_to :workout

  validates :challenge_id, presence: true
  validates :workout_id, presence: true


end
