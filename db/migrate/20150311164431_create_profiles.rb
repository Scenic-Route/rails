class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :location
      t.string :about_me
      t.integer :vehicle_year
      t.string :vehicle_make
      t.string :vehicle_model
      t.string :vehicle_link
      t.attachment :vehicle_photo
      t.timestamps null: false
    end
  end
end
