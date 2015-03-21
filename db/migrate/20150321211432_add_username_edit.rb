class AddUsernameEdit < ActiveRecord::Migration
  def change
    add_column :users, :can_edit_username, :boolean, default: false
  end
end
