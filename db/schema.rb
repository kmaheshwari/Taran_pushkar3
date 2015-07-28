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

ActiveRecord::Schema.define(:version => 20150728093030) do

  create_table "competetion_levels", :force => true do |t|
    t.string   "comp_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_winners", :force => true do |t|
    t.integer  "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.string   "event_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_events", :force => true do |t|
    t.string   "grp_event_name"
    t.string   "grp_event_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "grp_event_winners", :force => true do |t|
    t.integer  "gpoints"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "member_events", :force => true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "gender"
    t.string   "district"
    t.string   "state"
    t.string   "schl_club_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "comp_name"
  end

  create_table "race_timing_grp_evnts", :force => true do |t|
    t.integer  "gminute"
    t.integer  "gsecond"
    t.integer  "gmicro_second"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "race_timing_ind_evnts", :force => true do |t|
    t.integer  "minute"
    t.integer  "second"
    t.integer  "micro_second"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
