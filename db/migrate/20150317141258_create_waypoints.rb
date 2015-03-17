class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.decimal :longitude, precision: 12, scale: 10
      t.decimal :latitude, precision: 12, scale: 10
      t.attachment :photo
      t.string :comment
      t.integer :route_id
      t.integer :user_id
    end
  end
end
