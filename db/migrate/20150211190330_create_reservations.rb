class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :reservation_name
      t.string :phone_number
      t.integer :party_size
      t.date :date
      t.integer :time
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
