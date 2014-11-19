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

ActiveRecord::Schema.define(version: 20141113161243) do

  create_table "cars", force: true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string "cust_name"
    t.string "cust_address"
    t.string "cust_phone"
    t.string "cust_email"
  end

  create_table "employees", force: true do |t|
    t.string   "emp_name"
    t.string   "emp_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "employees", ["remember_token"], name: "index_employees_on_remember_token"

  create_table "invoices", force: true do |t|
    t.integer  "p_id"
    t.integer  "c_id"
    t.integer  "e_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "part_name"
    t.float    "part_price"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["car_id"], name: "index_parts_on_car_id"

end
