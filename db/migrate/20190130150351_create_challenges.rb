class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :workouts_needed
      t.string :reward
      t.text :notes
      t.integer :user_id
    end
  end
end
