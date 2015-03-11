class AddUserIdToStatTracker < ActiveRecord::Migration
  def change
    add_column :stat_trackers, :user_id, :integer
  end
end
