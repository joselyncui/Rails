class CreateVotes < ActiveRecord::Migration
  def change
	
    create_table :votes do |t|
      t.integer :user_id
      t.integer :idea_id
      t.string :choice

      t.timestamps null: false
    end
  end
end
