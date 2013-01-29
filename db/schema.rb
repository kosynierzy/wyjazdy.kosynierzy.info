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

ActiveRecord::Schema.define(:version => 20130129205238) do

  create_table "seasons", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.index ["name"], :name => "index_seasons_on_name", :unique => true, :order => {"name" => :asc}
  end

  create_table "matches", :force => true do |t|
    t.date     "date",       :null => false
    t.string   "home_team",  :null => false
    t.integer  "home_score"
    t.string   "away_team",  :null => false
    t.integer  "away_score"
    t.string   "game_type",  :null => false
    t.boolean  "won"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "stats_url"
    t.integer  "season_id"
    t.index ["season_id"], :name => "fk__matches_season_id", :order => {"season_id" => :asc}
    t.foreign_key ["season_id"], "seasons", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "matches_season_id_fkey"
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

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.index ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true, :order => {"confirmation_token" => :asc}
    t.index ["email"], :name => "index_users_on_email", :unique => true, :order => {"email" => :asc}
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true, :order => {"reset_password_token" => :asc}
    t.index ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true, :order => {"unlock_token" => :asc}
    t.index ["username"], :name => "index_users_on_username", :unique => true, :order => {"username" => :asc}
  end

  create_table "users_groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users_users_groups", :id => false, :force => true do |t|
    t.integer "users_id",        :null => false
    t.integer "users_groups_id", :null => false
    t.index ["users_groups_id"], :name => "fk__users_users_groups_users_groups_id", :order => {"users_groups_id" => :asc}
    t.index ["users_id"], :name => "fk__users_users_groups_users_id", :order => {"users_id" => :asc}
    t.foreign_key ["users_groups_id"], "users_groups", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "users_users_groups_users_groups_id_fkey"
    t.foreign_key ["users_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "users_users_groups_users_id_fkey"
  end

end
