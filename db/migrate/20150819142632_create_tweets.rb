class CreateTweets < ActiveRecord::Migration
    def up
    create_table :tweets do |t|
      t.string :user
      t.string :status
    end
  end
  def down
    drop_table :tweets
  end
end
