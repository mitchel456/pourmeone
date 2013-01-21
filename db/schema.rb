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

ActiveRecord::Schema.define(:version => 20130120204534) do

  create_table "drink_ingredients", :force => true do |t|
    t.integer  "drink_id"
    t.integer  "ingredient_id"
    t.integer  "unit_id"
    t.float    "amount"
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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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

end
