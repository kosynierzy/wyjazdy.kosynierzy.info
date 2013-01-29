class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
