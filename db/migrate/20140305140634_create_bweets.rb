class CreateBweets < ActiveRecord::Migration
  def change
    create_table :bweets do |t|
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
