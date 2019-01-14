class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :days
      t.integer :workout_amount
      t.string :prize
      t.text :notes
      t.integer :user_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
