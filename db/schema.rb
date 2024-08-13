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

ActiveRecord::Schema[7.2].define(version: 2024_08_13_045834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "redeem_codes", primary_key: "code", id: :string, force: :cascade do |t|
    t.datetime "start_redeem_at", null: false
    t.datetime "end_redeem_at", null: false
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", primary_key: "state", id: :string, force: :cascade do |t|
    t.string "redeem_code", null: false
    t.string "sequence", null: false
    t.boolean "attendance_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sessions", "redeem_codes", column: "redeem_code", primary_key: "code"
end
