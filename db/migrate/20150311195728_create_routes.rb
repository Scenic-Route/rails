class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.decimal :start_lat, precision: 12, scale: 10, presence: true
      t.decimal :start_long, precision: 12, scale: 10, presence: true
      t.decimal :end_lat, precision: 12, scale: 10, presence: true
      t.decimal :end_long, precision: 12, scale: 10, presence: true
      t.integer :user_id, presence: true
      t.string :name, presence: true
      t.integer :high_limit, presence: true
      t.integer :low_limit, presence: true
      t.integer :popularity, default: 0
      t.timestamps null: false
      t.float :police_rating
      t.float :traffic_rating
      t.float :quality_rating
    end
  end
end
