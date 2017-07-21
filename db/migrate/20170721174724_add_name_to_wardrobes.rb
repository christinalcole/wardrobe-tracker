class AddNameToWardrobes < ActiveRecord::Migration
  def change
    add_column :wardrobes, :names, :string
  end
end
