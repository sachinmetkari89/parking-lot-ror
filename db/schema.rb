# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20220403182635) do

  create_table "parking_lots", force: :cascade do |t|
    t.string "slot_number", null: false
    t.string "status", null: false
    t.integer "distance_from_entry_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slot_number", "status"], name: "index_parking_lots_on_slot_number_and_status", unique: true
    t.index ["slot_number"], name: "index_parking_lots_on_slot_number", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "parking_lot_id", null: false
    t.string "number", null: false
    t.string "car_reg_number", null: false
    t.string "car_color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_reg_number", "car_color"], name: "index_tickets_on_car_reg_number_and_car_color", unique: true
    t.index ["number"], name: "index_tickets_on_number", unique: true
  end

end
