class AddNameToWardrobes < ActiveRecord::Migration
  def change
    add_column :wardrobes, :name, :string
  end
end
