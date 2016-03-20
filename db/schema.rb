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

ActiveRecord::Schema.define(version: 20160320075723) do

  create_table "admin_areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admin_cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admin_listings", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "amenities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "icon_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "amenities_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", limit: 4
    t.integer "amenity_id", limit: 4
  end

  add_index "amenities_listings", ["amenity_id"], name: "index_amenities_listings_on_amenity_id", using: :btree
  add_index "amenities_listings", ["listing_id"], name: "index_amenities_listings_on_listing_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "pincode",    limit: 255
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "areas", ["city_id"], name: "index_areas_on_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.string   "description",            limit: 255
    t.string   "room_type",              limit: 255
    t.string   "bedrooms",               limit: 255
    t.string   "rent",                   limit: 255
    t.string   "rooms_for_rent",         limit: 255
    t.string   "available_from",         limit: 255
    t.string   "minimumstay",            limit: 255
    t.string   "current_roommates",      limit: 255
    t.string   "prefred_gender",         limit: 255
    t.string   "prefred_age",            limit: 255
    t.string   "prefred_occupation",     limit: 255
    t.string   "landmark",               limit: 255
    t.boolean  "phonenumber_visibility", limit: 1
    t.string   "security_deposit",       limit: 255
    t.string   "furnishing_status",      limit: 255
    t.boolean  "visible_status",         limit: 1,   default: false
    t.boolean  "verified_status",        limit: 1,   default: false
    t.integer  "user_id",                limit: 4
    t.integer  "admin_id",               limit: 4
    t.integer  "city_id",                limit: 4
    t.integer  "area_id",                limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "listings", ["admin_id"], name: "index_listings_on_admin_id", using: :btree
  add_index "listings", ["area_id"], name: "index_listings_on_area_id", using: :btree
  add_index "listings", ["city_id"], name: "index_listings_on_city_id", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "listings_rules", id: false, force: :cascade do |t|
    t.integer "listing_id", limit: 4
    t.integer "rule_id",    limit: 4
  end

  add_index "listings_rules", ["listing_id"], name: "index_listings_rules_on_listing_id", using: :btree
  add_index "listings_rules", ["rule_id"], name: "index_listings_rules_on_rule_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "listing_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",           limit: 255
    t.string   "last_name",            limit: 255
    t.string   "phone_no",             limit: 255
    t.string   "gender",               limit: 255
    t.string   "dob",                  limit: 255
    t.string   "occupation",           limit: 255
    t.string   "address",              limit: 255
    t.string   "about",                limit: 255
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "rules", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag",    limit: 1
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
