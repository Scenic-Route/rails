class CreateInterestPoints < ActiveRecord::Migration
  def change
    create_table :interest_points do |t|
      t.string :comment
      t.integer :route_id
      t.integer :user_id
      t.boolean :hazard
      t.boolean :police
      t.boolean :view
      t.attachment :photo
      t.decimal :latitude, :precision => 18, :scale => 15
      t.decimal :longitude, :precision => 18, :scale => 15
    end
  end
end
