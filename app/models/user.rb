class User < ApplicationRecord
  has_many :challenges

  has_secure_password

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true


   scope :current_challenges, ->(datetime) { where("current_challenges >= ?", datetime) }

    def current_challenges(challenges)
      @challenges = challenges
      @challenges.reject do |challenge|
        challenge.end_date.past?
      end
    end

    def expired_challenges(challenges)
      @challenges = challenges
      @challenges.reject do |challenge|
        !challenge.end_date.past?
      end
    end

end
