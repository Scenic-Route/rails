class AddLevelsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :level, :string, default: 'Bronze'
    add_column :profiles, :points, :integer, default: 0
  end
end
