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

ActiveRecord::Schema.define(version: 20161220200121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_parks", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "park_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id", "park_id"], name: "index_activity_parks_on_activity_id_and_park_id", unique: true, using: :btree
  end

  create_table "activity_players", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "player_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id", "player_id"], name: "index_activity_players_on_activity_id_and_player_id", unique: true, using: :btree
  end

  create_table "park_players", force: :cascade do |t|
    t.integer  "park_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id", "player_id"], name: "index_park_players_on_park_id_and_player_id", unique: true, using: :btree
  end

  create_table "parks", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "street_address"
    t.integer  "zip"
    t.float    "acres"
    t.string   "ward"
    t.float    "long"
    t.float    "lat"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.integer  "zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
