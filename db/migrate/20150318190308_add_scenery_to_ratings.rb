class AddSceneryToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :scenery_rating, :integer, default: 0
    add_column :ratings, :sport, :boolean, default: true
    add_column :ratings, :scenic, :boolean, default: true
    add_column :routes, :scenery_rating, :integer, default: 0
    rename_column :ratings, :police_rating, :twist_rating
  end
end
