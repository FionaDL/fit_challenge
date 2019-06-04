class UserSerializer < ActiveModel::Serializer
  attributes :id, :weight, :height, :quote
  has_many :challenges
end
