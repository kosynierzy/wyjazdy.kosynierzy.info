class AddTimestampsToTripsUsers < ActiveRecord::Migration
  def change
    add_column :trips_users, :created_at, :datetime
  end
end
