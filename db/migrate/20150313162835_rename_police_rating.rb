class RenamePoliceRating < ActiveRecord::Migration
  def change
    rename_column :routes, :police_rating, :twist_rating
  end
end
