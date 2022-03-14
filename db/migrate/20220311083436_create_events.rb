class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string "title", null: false, default: ""
      t.text "body", default: ""
      t.string "description", null: false, default: ""
      t.text "important_message", null: true
      t.string "owner", null: false, default: ""
      t.string "contact_to", null: false, default: ""
      t.integer "status", null: false, default: 0
      t.integer "locale", null: false, default: 0
      t.date "x_day"
      t.date "x_day_end"
      t.string "setup_time", default: ''
      t.string "break_time", default: ''
      t.string "setup_place", default: ''
      t.string "deadline", default: ''
      t.boolean "markdown", default: 1
      t.integer "limit", default: nil
      t.string "password"
      t.string "place", null: false, default: ""

      t.timestamps
    end
  end
end
