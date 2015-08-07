class CreateVotes < ActiveRecord::Migration
  def change
	drop_table :votes
    create_table :votes do |t|
      t.integer :user_id
      t.integer :idea_id
      t.string :choice

      t.timestamps null: false
    end
  end
end
