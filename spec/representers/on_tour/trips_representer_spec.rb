require 'spec_helper'

describe OnTour::TripsRepresenter do
  describe '#to_json' do
    let(:season) { create(:season) }

    before do
      trips = []

      5.times do |i|
        match = create(:match, season: season)
        trips << create(:trip, match: match)
      end

      json = trips.extend(described_class).to_json(current_user_trips: [])
      @parsed_body = JSON.parse(json)
    end

    it 'contains proper number of trips' do
      expect(@parsed_body.size).to eq(5)
    end
  end
end
