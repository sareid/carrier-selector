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

ActiveRecord::Schema.define(version: 20160402055915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriers", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_flights"
    t.integer  "num_cancelled_flights"
    t.float    "mean_ground_time_cancelled_flights"
    t.integer  "num_delayed_flights"
    t.float    "mean_delay_time"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "colour"
  end

  create_table "city_markets", force: :cascade do |t|
    t.string  "target_geo_id"
    t.integer "target_geo_id_2"
    t.string  "name"
    t.integer "population"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "month"
    t.integer  "day_of_month"
    t.integer  "day_of_week"
    t.datetime "flight_date"
    t.string   "carrier"
    t.string   "tail_num"
    t.integer  "flight_num"
    t.string   "origin_city_market"
    t.string   "origin_state_name"
    t.string   "dest_city_market"
    t.integer  "crs_dep_time"
    t.integer  "dep_time"
    t.integer  "dep_delay"
    t.string   "dep_time_blk"
    t.integer  "taxi_out"
    t.integer  "wheels_off"
    t.integer  "wheels_on"
    t.integer  "taxi_in"
    t.integer  "crs_arr_time"
    t.integer  "arr_time"
    t.integer  "arr_delay"
    t.string   "arr_time_blk"
    t.boolean  "cancelled"
    t.string   "cancellation_code"
    t.integer  "crs_elapsed_time"
    t.integer  "actual_elapsed_time"
    t.integer  "air_time"
    t.integer  "flights"
    t.integer  "distance"
    t.integer  "carrier_delay"
    t.integer  "first_dep_time"
    t.integer  "total_add_g_time"
    t.integer  "longest_add_g_time"
  end

end
