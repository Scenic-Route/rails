class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :route_id
      t.integer :user_id
      t.string :favorite_name
    end
  end
end
