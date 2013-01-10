class ChangeDateTypeToMatches < ActiveRecord::Migration
  def up
    change_column :matches, :date, :date, :null => false
  end

  def down
    change_column :matches, :date, :datetime, :null => false
  end
end
