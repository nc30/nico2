class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.belongs_to :event

      t.string "name", null: false, default: ""
      t.string "kana", null: false, default: ""
      t.integer "status", default: 0
      t.integer "index", null: false, default: 0
      t.string "comment", null: false
      t.integer "maker", default: 0
      t.string "maker_ex", null:false, default: ""
      t.string "bike", null: false
      t.integer "color", null:false, default: 0
      t.string "password", null: false
      t.integer "reserve_num"

      t.timestamps
    end
  end
end
