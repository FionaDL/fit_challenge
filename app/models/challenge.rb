class Challenge < ApplicationRecord
  belongs_to :user
  has_many :workouts

  def current
    !self.end_date.past?
  end
  def expired
    self.end_date.past?
  end

end
