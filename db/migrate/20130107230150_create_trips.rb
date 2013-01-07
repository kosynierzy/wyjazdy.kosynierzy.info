class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :match
      t.integer :official_number, :null => false, :default => 0
      t.text :comment, :null => true
      t.string :article_url, :null => true

      t.timestamps
    end
  end
end
