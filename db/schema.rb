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

ActiveRecord::Schema.define(:version => 20130109150403) do

  create_table "matches", :force => true do |t|
    t.datetime "date",       :null => false
    t.string   "home_team",  :null => false
    t.integer  "home_score"
    t.string   "away_team",  :null => false
    t.integer  "away_score"
    t.string   "game_type",  :null => false
    t.string   "season",     :null => false
    t.boolean  "won"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "stats_url"
  end

  create_table "trips", :force => true do |t|
    t.integer  "match_id"
    t.integer  "official_number", :default => 0, :null => false
    t.text     "comment"
    t.string   "article_url"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.index ["match_id"], :name => "fk__trips_match_id", :order => {"match_id" => :asc}
    t.foreign_key ["match_id"], "matches", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "trips_match_id_fkey"
  end

end
