class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :kind

    has_many :workouts, through: :challengeworkouts
end
