class ChallengeworkoutSerializer < ActiveModel::Serializer
  attributes :id, :workout_id, :challenge_id

  belongs_to :workout
  belongs_to :challenge
end
