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

ActiveRecord::Schema.define(version: 2020_06_08_010424) do

  create_table "cars", force: :cascade do |t|
    t.string "Make"
    t.string "Model"
    t.decimal "Cost", precision: 16, scale: 2
    t.text "Description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "year"
    t.boolean "in_inventory"
    t.integer "user_id"
    t.string "vin"
    t.string "License_Plate"
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "description"
    t.decimal "cost", precision: 16, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "car_id"
    t.integer "user_id"
  end

  create_table "refuels", force: :cascade do |t|
    t.decimal "miles", precision: 16, scale: 2
    t.decimal "gallons", precision: 16, scale: 2
    t.decimal "price", precision: 16, scale: 2
    t.integer "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["car_id"], name: "index_refuels_on_car_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
