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

ActiveRecord::Schema.define(version: 20151209114448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], :name => "index_seasons_on_name", :unique => true
  end

  create_table "matches", force: :cascade do |t|
    t.date     "date",                   null: false
    t.string   "home_team",  limit: 255, null: false
    t.integer  "home_score"
    t.string   "away_team",  limit: 255, null: false
    t.integer  "away_score"
    t.string   "game_type",  limit: 255, null: false
    t.boolean  "won"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "stats_url",  limit: 255
    t.integer  "season_id"
    t.index ["season_id"], :name => "fk__matches_season_id"
    t.foreign_key ["season_id"], "seasons", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "matches_season_id_fkey"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "official_number",             default: 0,  null: false
    t.text     "comment"
    t.string   "article_url",     limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "participants",                default: [], null: false, array: true
    t.index ["match_id"], :name => "fk__trips_match_id"
    t.index ["participants"], :name => "index_trips_on_participants"
    t.foreign_key ["match_id"], "matches", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "trips_match_id_fkey"
  end

end
