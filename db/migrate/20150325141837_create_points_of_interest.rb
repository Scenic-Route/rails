class CreatePointsOfInterest < ActiveRecord::Migration
  def change
    create_table :points_of_interests do |t|
      t.integer :route_id
      t.boolean :hazard
      t.boolean :police
      t.boolean :view
      t.attachment :photo
      t.decimal :latitude, :precision => 18, :scale => 15
      t.decimal :longitude, :precision => 18, :scale => 15
    end
  end
end
