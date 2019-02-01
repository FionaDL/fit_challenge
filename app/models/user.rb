class User < ApplicationRecord
  has_many :challenges

  has_secure_password

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
