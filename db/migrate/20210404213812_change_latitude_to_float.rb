class ChangeLatitudeToFloat < ActiveRecord::Migration[6.0]
  def change
        change_column :shops, :latitude, :float
  end
end
