class CreateGroupsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_users, :id => false do |t|
      t.references :groups, :null => false
      t.references :users, :null => false
    end
  end
end
