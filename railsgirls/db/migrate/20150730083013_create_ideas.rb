class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :user_id
      t.integer :like
      t.integer :dislike

      t.timestamps null: false
    end
  end
end
