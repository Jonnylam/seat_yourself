class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.integer :opens_at
      t.integer :closes_at
      t.string :picture_url
      t.text :description
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
