class AddUserid < ActiveRecord::Migration
  def up
    add_column :tweets, :user_id, :integer
    remove_column :tweets, :username, :string
  end

  def down
    add_column :tweets, :username, :string
    remove_column :tweets, :user_id, :integer
  end
end
