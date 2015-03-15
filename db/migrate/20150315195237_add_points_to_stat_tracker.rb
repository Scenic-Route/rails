class AddPointsToStatTracker < ActiveRecord::Migration
  def change
    add_column :stat_trackers, :points, :integer, default: 0
  end
end
