class AddSeasonIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :season_id, :integer
  end
end
