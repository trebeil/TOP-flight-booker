# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_06_135345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code", limit: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airports_on_code"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flight_id", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "start", null: false
    t.interval "duration", null: false
    t.integer "departure_airport_id", null: false
    t.integer "arrival_airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "flights", on_delete: :cascade
  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
end
