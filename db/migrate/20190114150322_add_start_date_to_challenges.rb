class AddStartDateToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :start_date, :date
  end
end
