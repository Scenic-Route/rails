class CreateStatTrackers < ActiveRecord::Migration
  def change
    create_table :stat_trackers do |t|
      t.integer :route_total, default: 0
      t.integer :comment_total, default: 0
      t.integer :rating_total, default: 0
      t.integer :checkin_total, default: 0
      t.timestamps null: false
    end
  end
end
