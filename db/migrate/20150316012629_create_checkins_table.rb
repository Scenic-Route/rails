class CreateCheckinsTable < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :route_id
      t.integer :user_id
      t.datetime :created_at, null: false
    end
  end
end
