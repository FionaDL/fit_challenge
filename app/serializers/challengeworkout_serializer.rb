class ChallengeworkoutSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :workout
  belongs_to :challenge
end
