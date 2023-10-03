class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start, null: false
      t.interval :duration, null: false
      t.integer :departure_airport_id, null: false
      t.integer :arrival_airport_id, null: false

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
