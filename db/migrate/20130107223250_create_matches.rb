class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date, :null => false
      t.string :home_team, :null => false
      t.integer :home_score, :null => true
      t.string :away_team, :null => false
      t.integer :away_score, :null => true
      t.string :game_type, :null => false
      t.string :season, :null => false
      t.boolean :won, :null => true

      t.timestamps
    end
  end
end
