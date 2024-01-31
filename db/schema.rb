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

ActiveRecord::Schema[7.1].define(version: 2024_01_30_230958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crossfitters", force: :cascade do |t|
    t.bigint "gyms_id", null: false
    t.integer "mem_id"
    t.string "name"
    t.boolean "oly_lift"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gyms_id"], name: "index_crossfitters_on_gyms_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.boolean "always_open"
    t.integer "num_of_platforms"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crossfitters", "gyms", column: "gyms_id"
end
