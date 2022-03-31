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

ActiveRecord::Schema.define(version: 2022_03_30_073440) do

  create_table "bulletin_criteria", force: :cascade do |t|
    t.integer "criteria_id"
    t.integer "bulletin_id"
  end

  create_table "bulletins", force: :cascade do |t|
    t.string "subject", limit: 400, null: false
    t.string "from_address", limit: 130, null: false
    t.text "body"
    t.text "header"
    t.text "footer"
    t.string "sent_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "criteria_bulletins", force: :cascade do |t|
    t.integer "crituser_id"
    t.integer "bulletin_id"
  end

  create_table "critusers", force: :cascade do |t|
    t.string "user_criteria", limit: 130
  end

  create_table "sublist_bulletins", force: :cascade do |t|
    t.integer "subscriber_list_id"
    t.integer "bulletin_id"
  end

  create_table "sublist_subs", force: :cascade do |t|
    t.integer "subscriber_list_id"
    t.integer "subscriber_id"
  end

  create_table "subscriber_lists", force: :cascade do |t|
    t.string "list_name"
    t.string "list_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
