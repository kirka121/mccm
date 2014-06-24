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

ActiveRecord::Schema.define(version: 20140624193540) do

  create_table "carousel_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "question"
    t.text     "answer"
  end

  create_table "invitations_sents", force: true do |t|
    t.string "email"
    t.text   "confirmation_key"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "content"
    t.text     "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "title"
    t.string   "copyright"
    t.integer  "carousel_mode"
    t.integer  "registration_mode"
    t.integer  "contactus_mode"
    t.text     "videos_index_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "videos_index_description_html"
    t.text     "moto"
    t.text     "admin_email"
    t.text     "server_url"
    t.text     "developer_email"
    t.text     "default_from_email"
    t.integer  "display_faq"
  end

  create_table "static_pages", force: true do |t|
    t.string "title"
    t.string "author"
    t.text   "content"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "admin_level"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "needs_activation"
    t.text     "activation_key"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "video_sections", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "comments"
    t.integer  "video_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
  end

end
