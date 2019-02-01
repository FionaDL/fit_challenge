class CreateChallengeWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :challengeworkouts do |t|
      t.integer :challenge_id
      t.integer :workout_id
      t.integer :workout_duration
    end
  end
end
