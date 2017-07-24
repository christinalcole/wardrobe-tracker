class CreateWardrobes < ActiveRecord::Migration
  def change
    create_table :wardrobes do |t|
      t.string :item
      t.string :description
      t.timestamps null: false
    end
  end
end
