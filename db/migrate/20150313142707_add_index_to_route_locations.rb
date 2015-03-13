class AddIndexToRouteLocations < ActiveRecord::Migration
  def change
    add_index(:routes, [:start_lat, :start_long], name: 'location_index')
  end
end
