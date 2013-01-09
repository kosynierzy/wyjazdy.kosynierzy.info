class AddStatsUrlToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :stats_url, :string
  end
end
