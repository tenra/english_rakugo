# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170205081244) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "number"
    t.integer  "people",     default: 1
  end

  add_index "bookings", ["event_id"], name: "index_bookings_on_event_id"
  add_index "bookings", ["user_id", "event_id"], name: "index_bookings_on_user_id_and_event_id", unique: true
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.string   "name"
    t.string   "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.date     "date"
    t.time     "time"
    t.integer  "price"
    t.integer  "capacity"
    t.date     "end_date"
    t.time     "end_time"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "country"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "private",    default: false, null: false
  end

  create_table "timetables", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "time"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "timetables", ["event_id"], name: "index_timetables_on_event_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin"
    t.boolean  "agreement",              default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
