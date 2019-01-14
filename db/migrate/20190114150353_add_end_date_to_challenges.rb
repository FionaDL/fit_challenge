class AddEndDateToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :end_date, :date
  end
end
