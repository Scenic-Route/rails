class ChangePrecision < ActiveRecord::Migration
  def change
    change_column :routes, :latitude, :decimal, :precision => 18, :scale => 15
    change_column :routes, :longitude, :decimal, :precision =>18, :scale => 15
    change_column :routes, :end_lat, :decimal, :precision => 18, :scale => 15
    change_column :routes, :end_long, :decimal, :precision => 18, :scale => 15
    change_column :waypoints, :latitude, :decimal, :precision => 18, :scale => 15
    change_column :waypoints, :latitude, :decimal, :precision => 18, :scale => 15
  end
end
