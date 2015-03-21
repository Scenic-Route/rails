class AddUsernameToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :username, :string
  end
end
