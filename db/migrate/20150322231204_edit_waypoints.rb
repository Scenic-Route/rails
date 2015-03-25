class EditWaypoints < ActiveRecord::Migration
  def change
    remove_attachment :waypoints, :photo
    remove_column :waypoints, :user_id
    change_column :waypoints, :longitude, :decimal, :precision => 18, :scale => 15
    add_column :waypoints, :waypoint_order, :integer
  end
end
