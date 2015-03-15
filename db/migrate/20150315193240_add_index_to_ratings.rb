class AddIndexToRatings < ActiveRecord::Migration
  def change
    add_index :ratings, :route_id
  end
end
