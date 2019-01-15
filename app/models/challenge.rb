class Challenge < ApplicationRecord
  belongs_to :user
  has_many :workouts

  def current(challenges)
    challenges.map do |challenge|
      !challenge.end_date.past?
    end
  end

  def expired
    self.end_date.past?
  end

end
