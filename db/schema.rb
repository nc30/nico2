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

ActiveRecord::Schema[7.0].define(version: 2022_03_11_083439) do
  create_table "entries", force: :cascade do |t|
    t.integer "event_id"
    t.string "name", default: "", null: false
    t.string "kana", default: "", null: false
    t.integer "status", default: 0
    t.integer "index", default: 0, null: false
    t.string "comment", null: false
    t.integer "maker", default: 0
    t.string "maker_ex", default: "", null: false
    t.string "bike", null: false
    t.integer "color", default: 0, null: false
    t.string "password", null: false
    t.integer "reserve_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_entries_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "body", default: ""
    t.string "description", default: "", null: false
    t.text "important_message"
    t.string "owner", default: "", null: false
    t.string "contact_to", default: "", null: false
    t.integer "status", default: 0, null: false
    t.integer "locale", default: 0, null: false
    t.date "x_day"
    t.date "x_day_end"
    t.string "setup_time", default: ""
    t.string "break_time", default: ""
    t.string "setup_place", default: ""
    t.string "deadline", default: ""
    t.boolean "markdown", default: true
    t.integer "limit"
    t.string "password"
    t.string "place", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
