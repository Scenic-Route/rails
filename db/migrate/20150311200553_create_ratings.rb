class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :police_rating
      t.integer :quality_rating
      t.integer :traffic_rating
      t.integer :route_id
      t.integer :user_id
      t.string :comments
      t.timestamps null: false
    end
  end
end
