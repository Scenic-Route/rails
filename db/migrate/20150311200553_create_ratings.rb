class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :police_rating, presence: true
      t.integer :quality_rating, presence: true
      t.integer :traffic_rating, presence: true
      t.integer :route_id, presence: true
      t.integer :user_id, presence: true
      t.string :comments, default: ""
      t.timestamps null: false
    end
  end
end
