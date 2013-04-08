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

ActiveRecord::Schema.define(:version => 20130404043600) do

  create_table "drink_ingredients", :force => true do |t|
    t.integer  "drink_id"
    t.integer  "ingredient_id"
    t.string   "raw_text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "instructions"
    t.integer  "venue_id"
    t.decimal  "price"
    t.integer  "submitted_by"
    t.boolean  "approved"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "filepicker_url"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "parent_ingredient"
    t.text     "description"
    t.boolean  "approved"
    t.integer  "submitted_by"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "source_id"
    t.string   "source"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
