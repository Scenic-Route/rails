class AddColumnsToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :latitude, :decimal, precision: 18, scale: 15
    add_column :checkins, :longitude, :decimal, precision: 18, scale: 15
  end
end
