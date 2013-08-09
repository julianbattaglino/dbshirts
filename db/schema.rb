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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130809063726) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_photos", :force => true do |t|
    t.string   "product_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "url",         :limit => 100
    t.string   "title"
    t.integer  "category_id"
    t.decimal  "price",                      :precision => 10, :scale => 2
    t.boolean  "featured",                                                  :default => false
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
    t.string   "author"
    t.integer  "theme_id"
    t.text     "description"
    t.integer  "weight",                                                    :default => 100
  end

  add_index "products", ["weight"], :name => "products_weight_index"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "themes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "weight",      :default => 100
    t.boolean  "published",   :default => false
  end

  add_index "themes", ["weight"], :name => "themes_weight_index"

  create_table "tracks", :force => true do |t|
    t.integer  "views",          :default => 0
    t.string   "ip"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.string   "day"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "conversions"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin",             :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

end
