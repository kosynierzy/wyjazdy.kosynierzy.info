class RemoveSeasonFromMatches < ActiveRecord::Migration
  def up
    remove_column :matches, :season
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
