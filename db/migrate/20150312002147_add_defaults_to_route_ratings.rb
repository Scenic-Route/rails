class AddDefaultsToRouteRatings < ActiveRecord::Migration
  def change
    change_column_default :routes, :quality_rating, 0
    change_column_default :routes, :police_rating, 0
    change_column_default :routes, :traffic_rating, 0
  end
end
