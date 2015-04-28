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

ActiveRecord::Schema.define(version: 20150428145718) do

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "zh_TW_title",       null: false
    t.string   "zh_TW_content",     null: false
    t.text     "zh_TW_description"
    t.string   "zh_CN_title",       null: false
    t.string   "zh_CN_content",     null: false
    t.text     "zh_CN_description"
    t.string   "en_title",          null: false
    t.string   "en_content",        null: false
    t.text     "en_description"
    t.text     "zh_TW_applicables"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.integer  "top_rate"
    t.string   "state"
    t.text     "zh_CN_applicables"
    t.text     "en_applicables"
  end

  create_table "users", force: true do |t|
    t.string   "username",                                    null: false
    t.string   "email",                       default: "",    null: false
    t.string   "encrypted_password",          default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",                                    null: false
    t.boolean  "is_super_admin",              default: false
    t.boolean  "is_admin_manager",            default: false
    t.boolean  "is_customer_service_manager", default: false
    t.boolean  "is_product_manager",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
