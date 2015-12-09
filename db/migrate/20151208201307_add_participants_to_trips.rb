class AddParticipantsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :participants, :string, array: true, default: [], null: false
    add_index :trips, :participants, using: :gist
  end
end
