class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :workouts_needed, :reward, :notes, :user_id

  has_many :workouts, through: :challengeworkouts
end
