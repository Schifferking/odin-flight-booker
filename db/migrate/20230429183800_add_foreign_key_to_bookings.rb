class AddForeignKeyToBookings < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :flights, column: :flight_id
  end
end
