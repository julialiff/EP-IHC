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

ActiveRecord::Schema.define(version: 20160616193445) do

  create_table "checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "checkins", ["party_id", "created_at"], name: "index_checkins_on_party_id_and_created_at"
  add_index "checkins", ["party_id"], name: "index_checkins_on_party_id"
  add_index "checkins", ["user_id", "created_at"], name: "index_checkins_on_user_id_and_created_at"
  add_index "checkins", ["user_id"], name: "index_checkins_on_user_id"

  create_table "night_houses", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "email"
    t.string   "category"
    t.string   "state"
    t.string   "city"
    t.string   "neighbourhood"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "night_houses", ["email"], name: "index_night_houses_on_email", unique: true

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "addinfo"
    t.string   "musicstyle"
    t.integer  "NightHouse_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "partydate"
    t.string   "partytime"
    t.integer  "night_house_id"
    t.string   "picture"
  end

  add_index "parties", ["night_house_id"], name: "index_parties_on_night_house_id"

  create_table "photos", force: :cascade do |t|
    t.string   "pic"
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["party_id", "created_at"], name: "index_photos_on_party_id_and_created_at"
  add_index "photos", ["party_id"], name: "index_photos_on_party_id"
  add_index "photos", ["user_id", "created_at"], name: "index_photos_on_user_id_and_created_at"
  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cellphone"
    t.string   "photo"
    t.string   "birthdate"
    t.string   "occupation"
    t.string   "college"
    t.string   "state"
    t.string   "city"
    t.string   "neighbourhood"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
