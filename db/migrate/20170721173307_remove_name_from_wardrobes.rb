class RemoveNameFromWardrobes < ActiveRecord::Migration
  def change
    remove_column :wardrobes, :names, :string
  end
end
