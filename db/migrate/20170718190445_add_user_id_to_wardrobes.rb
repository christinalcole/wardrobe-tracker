class AddUserIdToWardrobes < ActiveRecord::Migration
  def change
    add_column :wardrobes, :user_id, :integer
  end
end
