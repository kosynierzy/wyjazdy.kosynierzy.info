class DropUsers < ActiveRecord::Migration
  def up
    drop_table :trips_users
    drop_table :users
  end

  def down
    create_table "users" do |t|
      t.string   "username",               limit: 254, default: "", null: false
      t.string   "email",                  limit: 255, default: "", null: false
      t.string   "encrypted_password",     limit: 255, default: "", null: false
      t.string   "reset_password_token",   limit: 255
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                      default: 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip",     limit: 255
      t.string   "last_sign_in_ip",        limit: 255
      t.string   "confirmation_token",     limit: 255
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "unconfirmed_email",      limit: 255
      t.integer  "failed_attempts",                    default: 0
      t.string   "unlock_token",           limit: 255
      t.datetime "locked_at"
      t.datetime "created_at",                                      null: false
      t.datetime "updated_at",                                      null: false
      t.index ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
      t.index ["email"], :name => "index_users_on_email", :unique => true
      t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
      t.index ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
      t.index ["username"], :name => "index_users_on_username", :unique => true
    end

    create_table "trips_users", id: false do |t|
      t.integer  "trip_id",    null: false
      t.integer  "user_id",    null: false
      t.datetime "created_at"
      t.index ["trip_id"], :name => "fk__trips_users_trip_id"
      t.index ["user_id"], :name => "fk__trips_users_user_id"
      t.foreign_key ["trip_id"], "trips", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_trips_users_trip_id"
      t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_trips_users_user_id"
    end
  end
end
