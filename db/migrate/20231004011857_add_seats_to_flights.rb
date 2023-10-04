class AddSeatsToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :seats, :integer, null: false
  end
end
