class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :route_id
      t.integer :user_id
      t.string :user_name
      t.text :content
      t.timestamps null: false
    end
  end
end
