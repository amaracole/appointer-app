class ChangeLongitudeToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :shops, :longitude, :float
  end
end
