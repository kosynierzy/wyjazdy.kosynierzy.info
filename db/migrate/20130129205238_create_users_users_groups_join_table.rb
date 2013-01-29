class CreateUsersUsersGroupsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_users_groups, :id => false do |t|
      t.references :users, :null => false
      t.references :users_groups, :null => false
    end
  end
end
