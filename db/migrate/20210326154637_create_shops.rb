class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :availability
      t.string :phone_number
      t.string :category
      t.integer :capacity
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
