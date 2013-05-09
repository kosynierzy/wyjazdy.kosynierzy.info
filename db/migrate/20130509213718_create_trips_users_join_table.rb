class CreateTripsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :trips_users, :id => false do |t|
      t.references :trip, :null => false
      t.references :user, :null => false
    end
  end
end
