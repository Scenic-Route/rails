class RenameLatAndLongColumns < ActiveRecord::Migration
  def change
    rename_column :routes, :start_lat, :latitude
    rename_column :routes, :start_long, :longitude
  end
end
