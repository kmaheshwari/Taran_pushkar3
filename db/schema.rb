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

ActiveRecord::Schema.define(:version => 20150731103258) do

  create_table "competetion_levels", :force => true do |t|
    t.string   "age_group"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "member_id"
  end

  add_index "competetion_levels", ["member_id"], :name => "competetion_levels_member_id_fk"

  create_table "event_winners", :force => true do |t|
    t.integer  "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "member_id"
    t.integer  "event_id"
  end

  add_index "event_winners", ["event_id"], :name => "event_winners_event_id_fk"
  add_index "event_winners", ["member_id"], :name => "event_winners_member_id_fk"

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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "member_id"
    t.integer  "group_event_id"
  end

  add_index "grp_event_winners", ["group_event_id"], :name => "grp_event_winners_group_event_id_fk"
  add_index "grp_event_winners", ["member_id"], :name => "grp_event_winners_member_id_fk"

  create_table "member_events", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "member_id"
    t.integer  "event_id"
  end

  add_index "member_events", ["event_id"], :name => "member_events_event_id_fk"
  add_index "member_events", ["member_id"], :name => "member_events_member_id_fk"

  create_table "member_groups", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "member_id"
    t.integer  "group_event_id"
  end

  add_index "member_groups", ["group_event_id"], :name => "member_groups_group_event_id_fk"
  add_index "member_groups", ["member_id"], :name => "member_groups_member_id_fk"

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
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "member_id"
    t.integer  "group_event_id"
    t.integer  "competetion_level_id"
  end

  add_index "race_timing_grp_evnts", ["competetion_level_id"], :name => "race_timing_grp_evnts_competetion_level_id_fk"
  add_index "race_timing_grp_evnts", ["group_event_id"], :name => "race_timing_grp_evnts_group_event_id_fk"
  add_index "race_timing_grp_evnts", ["member_id"], :name => "race_timing_grp_evnts_member_id_fk"

  create_table "race_timing_ind_evnts", :force => true do |t|
    t.integer  "minute"
    t.integer  "second"
    t.integer  "micro_second"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "member_id"
    t.integer  "event_id"
    t.integer  "competetion_level_id"
  end

  add_index "race_timing_ind_evnts", ["competetion_level_id"], :name => "race_timing_ind_evnts_competetion_level_id_fk"
  add_index "race_timing_ind_evnts", ["event_id"], :name => "race_timing_ind_evnts_event_id_fk"
  add_index "race_timing_ind_evnts", ["member_id"], :name => "race_timing_ind_evnts_member_id_fk"

  add_foreign_key "competetion_levels", "members", name: "competetion_levels_member_id_fk"

  add_foreign_key "event_winners", "events", name: "event_winners_event_id_fk"
  add_foreign_key "event_winners", "members", name: "event_winners_member_id_fk"

  add_foreign_key "grp_event_winners", "group_events", name: "grp_event_winners_group_event_id_fk"
  add_foreign_key "grp_event_winners", "members", name: "grp_event_winners_member_id_fk"

  add_foreign_key "member_events", "events", name: "member_events_event_id_fk"
  add_foreign_key "member_events", "members", name: "member_events_member_id_fk"

  add_foreign_key "member_groups", "group_events", name: "member_groups_group_event_id_fk"
  add_foreign_key "member_groups", "members", name: "member_groups_member_id_fk"

  add_foreign_key "race_timing_grp_evnts", "competetion_levels", name: "race_timing_grp_evnts_competetion_level_id_fk"
  add_foreign_key "race_timing_grp_evnts", "group_events", name: "race_timing_grp_evnts_group_event_id_fk"
  add_foreign_key "race_timing_grp_evnts", "members", name: "race_timing_grp_evnts_member_id_fk"

  add_foreign_key "race_timing_ind_evnts", "competetion_levels", name: "race_timing_ind_evnts_competetion_level_id_fk"
  add_foreign_key "race_timing_ind_evnts", "events", name: "race_timing_ind_evnts_event_id_fk"
  add_foreign_key "race_timing_ind_evnts", "members", name: "race_timing_ind_evnts_member_id_fk"

end
