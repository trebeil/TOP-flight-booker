class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code, null: false, limit: 3

      t.timestamps
    end
    add_index :airports, :code
  end
end
