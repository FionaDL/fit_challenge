class RemoveDaysFromChallenges < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :days, :integer
  end
end
