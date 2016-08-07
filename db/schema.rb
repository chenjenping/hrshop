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

ActiveRecord::Schema.define(version: 20160807024738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "amount"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "purchaser"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.integer  "consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree

  create_table "promotions", force: true do |t|
    t.integer  "amount"
    t.string   "discount"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
