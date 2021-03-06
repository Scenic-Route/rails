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

ActiveRecord::Schema.define(version: 20150325141837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkins", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.decimal  "latitude",   precision: 18, scale: 15
    t.decimal  "longitude",  precision: 18, scale: 15
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "route_id"
    t.integer "user_id"
    t.string  "favorite_name"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "interest_points", force: :cascade do |t|
    t.string   "comment"
    t.integer  "route_id"
    t.integer  "user_id"
    t.boolean  "hazard"
    t.boolean  "police"
    t.boolean  "view"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.decimal  "latitude",           precision: 18, scale: 15
    t.decimal  "longitude",          precision: 18, scale: 15
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "location"
    t.string   "about_me"
    t.integer  "vehicle_year"
    t.string   "vehicle_make"
    t.string   "vehicle_model"
    t.string   "vehicle_link"
    t.string   "vehicle_photo_file_name"
    t.string   "vehicle_photo_content_type"
    t.integer  "vehicle_photo_file_size"
    t.datetime "vehicle_photo_updated_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id"
    t.string   "level",                      default: "Bronze"
    t.integer  "points",                     default: 0
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "twist_rating"
    t.integer  "quality_rating"
    t.integer  "traffic_rating"
    t.integer  "route_id"
    t.integer  "user_id"
    t.string   "comments",       default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "scenery_rating", default: 0
    t.boolean  "sport",          default: true
    t.boolean  "scenic",         default: true
  end

  add_index "ratings", ["route_id"], name: "index_ratings_on_route_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.decimal  "latitude",       precision: 18, scale: 15
    t.decimal  "longitude",      precision: 18, scale: 15
    t.decimal  "end_lat",        precision: 18, scale: 15
    t.decimal  "end_long",       precision: 18, scale: 15
    t.integer  "user_id"
    t.string   "name"
    t.integer  "high_limit"
    t.integer  "low_limit"
    t.integer  "popularity",                               default: 0
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.float    "twist_rating",                             default: 0.0
    t.float    "traffic_rating",                           default: 0.0
    t.float    "quality_rating",                           default: 0.0
    t.integer  "scenery_rating",                           default: 0
    t.string   "username"
  end

  add_index "routes", ["latitude", "longitude"], name: "location_index", using: :btree

  create_table "stat_trackers", force: :cascade do |t|
    t.integer  "route_total",   default: 0
    t.integer  "comment_total", default: 0
    t.integer  "rating_total",  default: 0
    t.integer  "checkin_total", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "points",        default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "authentication_token"
    t.boolean  "can_edit_username",      default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "waypoints", force: :cascade do |t|
    t.decimal "longitude",      precision: 18, scale: 15
    t.decimal "latitude",       precision: 18, scale: 15
    t.string  "comment"
    t.integer "route_id"
    t.integer "waypoint_order"
  end

  add_foreign_key "identities", "users"
end
