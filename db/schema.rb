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

ActiveRecord::Schema.define(version: 20161218220742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "credit_card_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.text     "image_url"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "price"
    t.integer  "accomodation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.citext   "city"
    t.citext   "state"
    t.text     "address"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "nights", force: :cascade do |t|
    t.date     "date"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_nights_on_listing_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_reviews_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.citext   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "api_key"
    t.string   "avatar_url"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "authy_id"
    t.boolean  "verified"
    t.string   "slug"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "nights", "listings"
  add_foreign_key "reviews", "listings"
  add_foreign_key "reviews", "users"
end
