class DropGroups < ActiveRecord::Migration
  def up
    drop_table :groups_users
    drop_table :groups
  end

  def down
    create_table :groups do |t|
      t.string :name, :null => false

      t.timestamps
    end

    create_table :groups_users, :id => false do |t|
      t.references :group, :null => false
      t.references :user, :null => false
    end
  end
end
