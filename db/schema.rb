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

ActiveRecord::Schema.define(version: 20160705024548) do

  create_table "managers", force: :cascade do |t|
    t.integer  "nonprofit_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "managers", ["nonprofit_id"], name: "index_managers_on_nonprofit_id"
  add_index "managers", ["user_id"], name: "index_managers_on_user_id"

  create_table "nonprofits", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "photos" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "pictures", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"

  create_table "social_profiles", force: :cascade do |t|
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "linked_in"
    t.integer  "sociable_id"
    t.string   "sociable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "social_profiles", ["sociable_type", "sociable_id"], name: "index_social_profiles_on_sociable_type_and_sociable_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
