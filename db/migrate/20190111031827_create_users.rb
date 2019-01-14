class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :height
      t.integer :weight
      t.string :quote

      t.timestamps
    end
  end
end
