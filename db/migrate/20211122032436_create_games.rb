class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :gamecode
      t.integer :score
      t.integer :succes
      t.integer :miss

      t.timestamps
    end
  end
end
