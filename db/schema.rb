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

ActiveRecord::Schema.define(version: 2019_02_25_213755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "url"
    t.bigint "platform_id"
    t.bigint "influencer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["influencer_id"], name: "index_accounts_on_influencer_id"
    t.index ["platform_id"], name: "index_accounts_on_platform_id"
  end

  create_table "formats", force: :cascade do |t|
    t.string "type_of"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "influencers", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string "url"
    t.string "content"
    t.string "title"
    t.bigint "influencer_id"
    t.bigint "format_id"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["format_id"], name: "index_media_on_format_id"
    t.index ["influencer_id"], name: "index_media_on_influencer_id"
    t.index ["platform_id"], name: "index_media_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.boolean "read"
    t.integer "display_count"
    t.bigint "user_id"
    t.bigint "media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_id"], name: "index_states_on_media_id"
    t.index ["user_id"], name: "index_states_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "influencers"
  add_foreign_key "accounts", "platforms"
  add_foreign_key "media", "formats"
  add_foreign_key "media", "influencers"
  add_foreign_key "media", "platforms"
  add_foreign_key "states", "media", column: "media_id"
  add_foreign_key "states", "users"
end
