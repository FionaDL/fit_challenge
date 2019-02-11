class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challengeworkouts
  has_many :workouts, through: :challengeworkouts

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :workouts_needed, presence: true
  validate :start_date_cannot_be_in_the_past

 def start_date_cannot_be_in_the_past
   errors.add(:start_date, "can't be in the past") if
      start_date < Date.today
 end


  def left_to_complete(workouts_needed)
    workouts_needed - self.workouts.size
  end


end
