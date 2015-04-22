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

ActiveRecord::Schema.define(version: 20150417040005) do

  create_table "arena_attendances", force: :cascade do |t|
    t.integer  "private_arena_id"
    t.integer  "attendee_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "private_arenas", force: :cascade do |t|
    t.integer  "challenger_video_id"
    t.integer  "challengee_video_id"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "public_arenas", force: :cascade do |t|
    t.integer  "challenger_video_id"
    t.integer  "challengee_video_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_connections", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "avatar"
    t.string   "about_me"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "winner"
    t.string   "data_content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
