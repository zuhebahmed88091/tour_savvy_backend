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

ActiveRecord::Schema[7.0].define(version: 2023_10_31_170143) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.jsonb "package_type", default: []
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "packages_reservations", id: false, force: :cascade do |t|
    t.bigint "package_id", null: false
    t.bigint "reservation_id", null: false
    t.index ["package_id", "reservation_id"], name: "index_packages_reservations_on_package_id_and_reservation_id"
    t.index ["reservation_id", "package_id"], name: "index_packages_reservations_on_reservation_id_and_package_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date"
    t.string "city_name"
    t.string "package_name"
    t.string "package_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "user_token", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "packages", "users"
  add_foreign_key "reservations", "users"
end
